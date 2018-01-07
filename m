From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:35:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: PKG_CHECK_MODULES
 should not fail when libatomic_ops is missing
In-Reply-To: <20180107170738.21617-1-bernd.kuhls@t-online.de>
References: <20180107170738.21617-1-bernd.kuhls@t-online.de>
Message-ID: <20180107213546.40bee840@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 18:07:38 +0100, Bernd Kuhls wrote:
> According to https://autotools.io/pkgconfig/pkg_check_modules.html
> "In contrast with almost all of the original macros, though, the default
>  action-if-not-found will end the execution with an error for not having
>  found the dependency."
> 
> Fixes
> http://autobuild.buildroot.net/results/cea/cea777dc997f86c1122c8b818d264215a0e77e5a/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This commit log was a bit light in explanation, so improved it and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
