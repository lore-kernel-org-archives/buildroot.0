From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 22:42:15 +0200
Subject: [Buildroot] [PATCH] legacy: add missing select
In-Reply-To: <1477327560-12770-1-git-send-email-yann.morin.1998@free.fr>
References: <1477327560-12770-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161024224215.2401117a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Oct 2016 18:46:00 +0200, Yann E. MORIN wrote:
> When adding a boolean option to legacy, it should slect BR2_LEGACY, to
> trigger the legacy warning.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
