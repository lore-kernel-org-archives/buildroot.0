From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 11:12:22 +0200
Subject: [Buildroot] FW: [PATCH] external toolchain: use relative path
 to external toolchain.
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006BF60@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF60@ezex10.ezchip.com>
Message-ID: <20140420111222.2a38cdd7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noam Camus,

On Sun, 23 Feb 2014 08:29:34 +0000, Noam Camus wrote:
> Now configuration may include relative path to external toolchain.
> 
> Signed-off-by: Noam Camus <noamc@ezchip.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

A week or two after you submitted this patch, Yann E. Morin asked some
questions about why this is needed (e-mail from March, 4th), and you
never came back with answers to Yann's questions. Since Yann basically
questions the usefulness of the patch, I'm going to mark this patch as
"Rejected" for now in our patchwork tool. If, despite Yann comments,
you feel that this patch is still useful for you, please resubmit with
a more detailed commit log that explains *why* it is needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
