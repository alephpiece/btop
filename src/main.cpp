// SPDX-License-Identifier: Apache-2.0

#include "btop.hpp"

#include <string_view>
#include <vector>

auto main(int argc, const char* argv[]) -> int {
	auto args = std::vector<std::string_view>{};
	args.reserve(argc > 0 ? static_cast<size_t>(argc - 1) : 0);

	for (int i = 1; i < argc; ++i) {
		args.emplace_back(argv[i]);
	}

	return btop_main(args);
}
