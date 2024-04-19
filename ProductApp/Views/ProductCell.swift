import UIKit

class ProductCell: UITableViewCell {
    
    lazy private var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.textColor = UIColor.black
        return label
    }()
    
    lazy private var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 255/255, green: 69/255, blue: 0/255, alpha: 1.0)
        return label
    }()
    
    lazy private var discountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 34/255, green: 139/255, blue: 34/255, alpha: 1.0)
        return label
    }()
    
    lazy private var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 255/255, green: 140/255, blue: 0/255, alpha: 1.0)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        applyStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(discountLabel)
        contentView.addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 100),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 12),
            
            discountLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            discountLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),
            
            ratingLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            ratingLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 12),
            ratingLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    private func applyStyle() {
        contentView.backgroundColor = UIColor.white
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowRadius = 4
        contentView.layer.masksToBounds = false
    }
    
    func configure(with product: Product) {
        if let url = URL(string: product.thumbnail) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async { [weak self] in
                        if let image = UIImage(data: data) {
                            self?.thumbnailImageView.image = image
                        }
                    }
                }
            }
        }
        titleLabel.text = product.title.capitalized
        priceLabel.text = "$\(product.price)"
        discountLabel.text = "\(product.discountPercentage)% off"
        ratingLabel.text = "Rating: \(product.rating)"
    }
}
