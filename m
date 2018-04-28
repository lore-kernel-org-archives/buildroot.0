From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 22:08:51 +0200
Subject: [Buildroot] [PATCH 1/1] libcrossguid: bump to version 0.2.2
In-Reply-To: <20180428200043.2509-1-fontaine.fabrice@gmail.com>
References: <20180428200043.2509-1-fontaine.fabrice@gmail.com>
Message-ID: <20180428220851.08e10ddc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Apr 2018 22:00:43 +0200, Fabrice Fontaine wrote:
>  - Add hash for license file
>  - guid.cpp and guid.h have been renamed Guid.cpp and Guid.hpp (they
> will be renamed back to guid.cpp and guid.hpp in next release)
>  - Continue to use package-generic infrastructure as cmake doesn't work
>    properly with this version. Commit such as https://github.com/graeme-hill/crossguid/commit/974def4e0ad62b8fea17d6dee7c4f9b0d65eaa2c is needed. Migration on cmake should be done in next package release.

The formatting of the commit log is not really great. Bullets in the
list are not aligned, and it's not wrapped to 72 characters. I've fixed
that and applied. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
