import '../styles/lixi.css'

const lixi = () => {
const [isOpen, setIsOpen] = useState(false);

  const openDialog = () => setIsOpen(true);
  const closeDialog = () => setIsOpen(false);

  return (
    <div>
      <button onClick={openDialog}>Open Dialog</button>
      {isOpen && (
        <div className="dialog-overlay">
          <div className="dialog">
            <img
              src="../app/src/assets/images/img.png"
              alt="Dialog"
              className="dialog-image"
            />
            <p>This is a dialog with an image.</p>
            <button onClick={closeDialog}>Đóng</button>
          </div>
        </div>
      )}
    </div>
  );
}
export default lixi