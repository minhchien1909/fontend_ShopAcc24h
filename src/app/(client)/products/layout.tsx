import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Danh sách acc",
  description:
    "Danh sách acc tại Shop Acc24h - Tài khoản game chất lượng, đa dạng game, giao nhanh và bảo hành uy tín.",
};

export default function ProductsLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <>{children}</>;
}
