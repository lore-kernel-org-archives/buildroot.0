From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 22:25:58 +0100
Subject: [Buildroot] [PATCH v2 1/1] json for modern c++: new package
In-Reply-To: <20171230192437.6706-1-Adamduskett@outlook.com>
References: <20171230192437.6706-1-Adamduskett@outlook.com>
Message-ID: <20171230222558.762f4938@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Dec 2017 14:24:37 -0500, Adam Duskett wrote:

> +config BR2_PACKAGE_JSON_FOR_MODERN_CPP
> +	bool "json for modern c++"

Changed to json-for-modern-cpp

> new file mode 100644
> index 0000000000..8f31c8921d
> --- /dev/null
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# json for modern c++

Changes to json-for-modern-cpp

> +JSON_FOR_MODERN_CPP_INSTALL_STAGING = YES

Since it's a header only library, I've added <pkg>_INSTALL_TARGET = NO.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
