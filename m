From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 12:28:30 +0100
Subject: [Buildroot] [PATCH next 1/2] libsigsegv: fix patch failure of
 0004-Add-stack...
In-Reply-To: <1424684247-3644-1-git-send-email-user@ld2077>
References: <1424684247-3644-1-git-send-email-user@ld2077>
Message-ID: <20150223122830.7e0bdd6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Mon, 23 Feb 2015 10:37:26 +0100, Fabio Porcedda wrote:
> From: Fabio Porcedda <fabio.porcedda@gmail.com>
> 
> After removing the patch 0001-Add-stack... in commit
> 9863553fe8fa16a4d19f652b409a44bb58ef5567 "packages: all salute the
> passing of avr32" the patch 004-Add-stack... does not apply anymore, so
> fix it.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  .../0004-Add-stack-direction-for-the-Blackfin-architecture.patch        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
