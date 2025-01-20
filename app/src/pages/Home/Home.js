import "../../styles/home.css";

const Home = () => {
  const showLiXi = () => {
    const container = document.getElementById("bao-li-xi-container");

    // Tạo 30 phần tử lì xì
    for (let i = 0; i < 30; i++) {
      const liXi = document.createElement("div");
      liXi.className = "lixi";
      liXi.style.left = Math.random() * 100 + "vw";
      liXi.style.animationDuration = Math.random() * 2 + 3 + "s";
      liXi.style.animationDelay = Math.random() * 2 + "s";
      container.appendChild(liXi);

      // Xóa lì xì sau khi hoàn thành animation
      liXi.addEventListener("animationend", () => {
        liXi.remove();
      });
    }

    console.log("ad");
    
  };

  return (
    <>
      <div className="container">
        <h1>Chúc Mừng Năm Mới 2025 🎉</h1>
        <p>Chúc bạn một năm mới tràn đầy sức khỏe, hạnh phúc và thành công!</p>
        <p>8386 mãi đỉnh</p>
        {/* Đổi onclick thành onClick */}
        <button onClick={showLiXi}>Nhận Bao Lì Xì 💌</button>
      </div>
      <div id="bao-li-xi-container"></div>
    </>
  );
};

export default Home;
