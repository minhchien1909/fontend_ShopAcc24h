import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Danh sách game",
  description:
    "Danh sách game tại cửa hàng Game Store - Bộ sưu tập game chất lượng cao, đa dạng thể loại, phục vụ tận tình.",
};

export default function ProductsLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <>{children}</>;
}
