From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 23:48:20 +0100
Subject: [Buildroot] [PATCH] package/gdb: disable simulator support for
 microblaze
In-Reply-To: <1479161134-10097-1-git-send-email-romain.naour@gmail.com>
References: <1479161134-10097-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161114234820.70457e80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 23:05:34 +0100, Romain Naour wrote:
> The gdb simulator seems missing with the Xilinx fork of gdb.
> Disable it for microblaze since only the Xilinx version of gdb is
> currently available.
> 
> Fixes:
> http://autobuild.buildroot.net/results/907/9079dad3f138c313a6abb40825baf4d9683a2422
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
> ---
>  package/gdb/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
