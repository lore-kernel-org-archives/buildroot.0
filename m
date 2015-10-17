From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:25:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/rtmpdump: Remove optional
 dependency to PolarSSL
In-Reply-To: <1445075158-16762-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445075158-16762-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151017162555.56576e62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 17 Oct 2015 11:45:57 +0200, Bernd Kuhls wrote:
> The makefile of rtmpdump has no support for PolarSSL, so lets remove
> support for it, as supposed by Gustavo:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/129531
> 
> Fixes
> http://autobuild.buildroot.net/results/45d/45dd9adbac449ce0ed66af5b4655b4d9b37faa62/
> http://autobuild.buildroot.net/results/ae0/ae0c4bab7975ed2ad77a9f9fd6a300d1327d56b9/
> http://autobuild.buildroot.net/results/029/029695a022ba12ff177521ebc3334d7ac2373ddc/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/rtmpdump/rtmpdump.mk | 3 ---
>  1 file changed, 3 deletions(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
