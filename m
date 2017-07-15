From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 11:43:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglfw: bump version to 3.2.1
In-Reply-To: <20170713202229.14109-1-bernd.kuhls@t-online.de>
References: <20170713202229.14109-1-bernd.kuhls@t-online.de>
Message-ID: <20170715114327.406e19aa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 22:22:29 +0200, Bernd Kuhls wrote:
> License file was renamed:
> https://github.com/glfw/glfw/commit/e2ce3026a0ae01ecfeefc5af0b2f834d560303d7

Did you actually test this change? Because the license file was *not*
renamed in 3.2.1: it is still named COPYING.txt. This commit is perhaps
after 3.2.1, but definitely the license file is not LICENSE.md after
bumping to 3.2.1.

I've applied after fixing this. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
