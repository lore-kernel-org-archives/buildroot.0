From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:34:20 +0200
Subject: [Buildroot] [PATCH v2] automake: use whenever possible the
 ACLOCAL_HOST_DIR variable
In-Reply-To: <1423392056-30339-1-git-send-email-fabio.porcedda@gmail.com>
References: <1423392056-30339-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150614233420.6dddd541@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sun,  8 Feb 2015 11:40:56 +0100, Fabio Porcedda wrote:
> Use the ACLOCAL_HOST_DIR in the GTK_DOC_M4_INSTALL hook.
> 
> Move the ACLOCAL_HOST_DIR definition at the beginning so the definition
> is ahead the utilization.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/automake/automake.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
