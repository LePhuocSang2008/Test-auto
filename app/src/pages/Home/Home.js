import "../../styles/home.css";
import "../../styles/lixi.css";
import IMG from "../../assets/images/img.png"
import React, { useState } from "react";
import { Dialog, DialogContent, DialogActions, Button } from "@mui/material";

const Home = () => {


  const showLiXi = () => {
    setOpen(true);

    const container = document.getElementById("bao-li-xi-container");
    // Tạo 30 phần tử lì xì
    for (let i = 0; i < 10; i++) {
      const liXi = document.createElement("div");
      liXi.className = "lixi";
      // liXi.style.left = Math.random() * 100 + "vw";
      liXi.style.right = Math.random() * 100 + "vw";
      liXi.style.animationDuration = Math.random() * 2 +2 + "s";
      liXi.style.animationDelay = Math.random() * 2 + "s";
      liXi.style.width = 100%
      container.appendChild(liXi);

      // Xóa lì xì sau khi hoàn thành animation
      liXi.addEventListener("animationend", () => {
        liXi.remove();
      });
    }
  };

  const [open, setOpen] = useState(false);

  //  const handleOpen = () => setOpen(true);
  const handleClose = () => setOpen(false);
  
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

      <div>
        <Dialog open={open} onClose={handleClose}>
          <DialogContent>
            <p
              style={{
                color: "red",
                marginBottom: 0,
              }}
            >
              Quét mã liền tay
            </p>
            <p
              style={{
                color: "red",
              }}
            >
              Lì xì trao tay
            </p>
            <img
              src={IMG}
              alt="Binny"
              style={{ maxWidth: "100%", borderRadius: "10px" }}
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose} color="primary">
              Đóng
            </Button>
          </DialogActions>
        </Dialog>
      </div>
    </>
  );
};

export default Home;
