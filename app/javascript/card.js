const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  if (!submit){ return false;}
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_address[number]"),
      cvc: formData.get("purchase_address[cvc]"),
      exp_month: formData.get("purchase_address[exp_month]"),
      exp_year: `20${formData.get("purchase_address[exp_year]")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        //valueが実際に送られる値,type="hidden"でブラウザで非表示にする
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        //フォームの中に作成したinput要素を追加する
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      //フォームに存在するカード情報を削除する
      
      document.getElementById("charge-form").submit();
      // e.preventDefault();という記載でrailsのフォーム処理をキャンセルしているため、フォーム情報を上記のようにしてサーバーサイドに送信する
    });
  });
};

window.addEventListener("load", pay);