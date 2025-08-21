/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
  transpilePackages: ["react-quill"],
  images: {
    remotePatterns: [
      {
        hostname: "scontent.fhan17-1.fna.fbcdn.net",
      },
      {
        hostname: "res.cloudinary.com",
        port: "", // Thêm port nếu cần thiết
        pathname: "/**", // Thêm pathname để cho phép tất cả các đường dẫn
      },
      {
        hostname: "images.unsplash.com",
      },
      {
        hostname: "dev.mypagevn.com",
      },
      {
        hostname: "picsum.photos",
      },
      {
        hostname: "thegioihaisan.vn",
      },
    ],
  },
};

module.exports = nextConfig;
