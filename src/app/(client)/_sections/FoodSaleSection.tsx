import React, { useEffect, useState } from "react";
import Link from "next/link";

import CartProduct from "@/app/_shared/components/ui/Cart";
import Icon from "@/app/_shared/utils/Icon";
import { getFoodSale } from "@/app/_service/client/layout";

const PopularGameSection = () => {
  const [gameItems, setGameItems] = useState([]);
  const [activeFilter, setActiveFilter] = useState("all");

  const filteredItems =
    activeFilter === "all"
      ? gameItems
      : activeFilter === "hot"
      ? gameItems.filter((item: any) => item.hot)
      : gameItems.filter((item: any) => item.category === activeFilter);

  useEffect(() => {
    getFoodSale(activeFilter).then((res) => {
      if (res.ok && res.data) {
        const formattedData = res.data.map((item: any) => ({
          id: item.id,
          name: item.name,
          price: item.price,
          image: item.images,
          hot: item.hot,
          rating: parseFloat(item.star) || 0,
          category: item.category,
          quantity: parseInt(item.quantity),
          inStock: parseInt(item.quantity) > 0,
          status: item.status,
          quantity_sold: parseInt(item.quantity_sold),
        }));
        setGameItems(formattedData);
      }
    });
  }, [activeFilter]);

  return (
        <div id="game-sale" className="w-full bg-gray-50 py-8 sm:py-12 md:py-16">
      <div className="w-[95%] sm:w-[90%] md:w-[85%] lg:w-[80%] xl:w-[70%] mx-auto px-2 sm:px-4">
        {/* Header with decorative elements */}
        <div className="text-center mb-8 sm:mb-12 relative">
          <div className="absolute left-1/2 transform -translate-x-1/2 -top-6">
            <Icon icon="Gamepad2" size={36} className="text-[#d97706]" />
          </div>
          <h2 className="text-2xl sm:text-3xl md:text-4xl font-bold text-gray-800 mb-3 sm:mb-4 pt-8">
            Bộ Sưu Tập Game Hot
          </h2>
          <p className="text-sm sm:text-base text-gray-600 max-w-2xl mx-auto px-4">
            Khám phá những tựa game hấp dẫn nhất với đồ họa đỉnh cao và gameplay 
            được phát triển bởi những studio game hàng đầu thế giới
          </p>
          <div className="h-1 w-16 sm:w-20 bg-[#d97706] mx-auto mt-4 sm:mt-6"></div>
        </div>

        {/* Filter tabs */}
        <div className="flex justify-center mb-6 sm:mb-10">
          <div className="inline-flex flex-wrap gap-2 bg-white shadow-md rounded-lg p-1">
            <button
              onClick={() => setActiveFilter("all")}
              className={`px-3 sm:px-6 py-1.5 sm:py-2 text-sm sm:text-base rounded-lg transition-all ${
                activeFilter === "all"
                  ? "bg-[#d97706] text-white"
                  : "text-gray-700 hover:bg-gray-100"
              }`}
            >
              Tất cả
            </button>
            <button
              onClick={() => setActiveFilter("hot")}
              className={`px-3 sm:px-6 py-1.5 sm:py-2 text-sm sm:text-base rounded-lg transition-all ${
                activeFilter === "hot"
                  ? "bg-[#d97706] text-white"
                  : "text-gray-700 hover:bg-gray-100"
              }`}
            >
              Game hot
            </button>
            <button
              onClick={() => setActiveFilter("action")}
              className={`px-3 sm:px-6 py-1.5 sm:py-2 text-sm sm:text-base rounded-lg transition-all ${
                activeFilter === "action"
                  ? "bg-[#d97706] text-white"
                  : "text-gray-700 hover:bg-gray-100"
              }`}
            >
              Hành động
            </button>
            <button
              onClick={() => setActiveFilter("rpg")}
              className={`px-3 sm:px-6 py-1.5 sm:py-2 text-sm sm:text-base rounded-lg transition-all ${
                activeFilter === "rpg"
                  ? "bg-[#d97706] text-white"
                  : "text-gray-700 hover:bg-gray-100"
              }`}
            >
              RPG
            </button>
            <button
              onClick={() => setActiveFilter("strategy")}
              className={`px-3 sm:px-6 py-1.5 sm:py-2 text-sm sm:text-base rounded-lg transition-all ${
                activeFilter === "strategy"
                  ? "bg-[#d97706] text-white"
                  : "text-gray-700 hover:bg-gray-100"
              }`}
            >
              Chiến thuật
            </button>
          </div>
        </div>

        {/* Menu grid with improved cards */}
        <CartProduct filteredItems={filteredItems} />

        {/* Call to action button */}
        <div className="text-center mt-8 sm:mt-10 md:mt-14">
          <Link
            href="/products"
            className="inline-flex items-center bg-[#d97706] text-white font-medium text-sm sm:text-base px-6 sm:px-8 py-2 sm:py-3 rounded-lg shadow-md hover:bg-[#d97706d7] transition-all duration-300 transform hover:-translate-y-1"
          >
            <span>Xem thêm game </span>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="h-4 w-4 sm:h-5 sm:w-5 ml-2"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M14 5l7 7m0 0l-7 7m7-7H3"
              />
            </svg>
          </Link>
        </div>
      </div>
    </div>
  );
};

export default PopularGameSection;
