From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 22:03:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsync: fix build without C++
 support
In-Reply-To: <20170926171050.16750-1-bernd.kuhls@t-online.de>
References: <20170926171050.16750-1-bernd.kuhls@t-online.de>
Message-ID: <20170927220324.19182a15@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Sep 2017 19:10:50 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/3ca/3cacb87e39a0ebb9d227fff4be71bea8132bf0ed/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...CMakeLists.txt-Don-t-require-a-C-compiler.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/librsync/0001-CMakeLists.txt-Don-t-require-a-C-compiler.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
