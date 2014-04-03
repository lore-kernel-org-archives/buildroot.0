From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 11:06:16 +0200
Subject: [Buildroot] [PATCH v2 30/41] xbmc: needs host-gawk (v3)
In-Reply-To: <1396468015-1724-30-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
 <1396468015-1724-30-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140403110616.603d8a6b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed,  2 Apr 2014 21:46:44 +0200, Bernd Kuhls wrote:
> Changes
> v3: rebased http://patchwork.ozlabs.org/patch/334971/
> v2: Keep dependencies sorted
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> Acked-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/xbmc.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The title of this patch makes it non-applicable: the (v3) should not be
at the end of the commit title between parenthesis, because if it is,
then it gets preserved as part of the commit title when applying the
patch.

If you want to add such information, please use [blabla] at the
beginning of the commit title, so that the title of the patch becomes:

[PATCH v2 30/41] [v3] xbmc: needs host-gawk

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
