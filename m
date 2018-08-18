From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 11:23:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: Fix uClibc build on
 64bit platforms by including stdint.h
In-Reply-To: <20180818080801.15299-1-bernd.kuhls@t-online.de>
References: <20180818080801.15299-1-bernd.kuhls@t-online.de>
Message-ID: <20180818112302.179726a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 10:08:01 +0200, Bernd Kuhls wrote:
> Patch needed to be updated for samba-4.8.4
> 
> Fixes
> http://autobuild.buildroot.net/results/140/1404a594583ff192d70086ef590f924472465c89/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-on-64bit-platforms-by-including-std.patch | 26 +++++++++++++++----
>  1 file changed, 21 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
