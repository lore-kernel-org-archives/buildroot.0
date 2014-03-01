From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 20:41:33 +0100
Subject: [Buildroot] [PATCH] libmicrohttpd: disable curl testcases
In-Reply-To: <1393699309-25956-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393699309-25956-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140301204133.743ad9bf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat,  1 Mar 2014 15:41:49 -0300, Gustavo Zacarias wrote:
> They require a toolchain with IPv6. Fixes:
> http://autobuild.buildroot.net/results/edb/edb1b5ee1ffaa6a495b4d7c2976f618c8331b5d2/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libmicrohttpd/libmicrohttpd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
