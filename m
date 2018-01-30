From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 23:22:12 +0100
Subject: [Buildroot] [PATCH 1/2] package/samba4: Fix uClibc build on
 64bit platforms by including stdint.h
In-Reply-To: <20180128125334.11755-1-bernd.kuhls@t-online.de>
References: <20180128125334.11755-1-bernd.kuhls@t-online.de>
Message-ID: <20180130232212.7137b3d1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Jan 2018 13:53:33 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/fdd/fdd9bb5bea4488fc9e16746222051156224317a6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...build-on-64bit-platforms-by-including-std.patch | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
