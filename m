From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:42:15 +0200
Subject: [Buildroot] [PATCH v4 1/4] Makefile: fix coding style
In-Reply-To: <1396864610-8426-2-git-send-email-fabio.porcedda@gmail.com>
References: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
 <1396864610-8426-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140416194215.7d3151fa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Mon,  7 Apr 2014 11:56:47 +0200, Fabio Porcedda wrote:
> As stated in the buildroot user manual add just a single space before
> and after a '=' sign.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  Makefile | 184 +++++++++++++++++++++++++++++++--------------------------------
>  1 file changed, 92 insertions(+), 92 deletions(-)

To be honest, while I definitely value the change to harmonize the
coding style, such a large patch touching almost every line of the main
Makefile is a recipe for conflicts with many other patches. So I would
personally prefer to not apply this patch, and do the coding style
fixes progressively, as we make other changes to the main Makefile.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
