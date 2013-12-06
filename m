From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Dec 2013 10:38:17 +0100
Subject: [Buildroot] [PATCH 1/3] package/lvm2: remove uninstall commands
In-Reply-To: <87b70aafdc14794df97eaa937c841609d9b45ab4.1386023329.git.yann.morin.1998@free.fr>
References: <cover.1386023329.git.yann.morin.1998@free.fr>
 <87b70aafdc14794df97eaa937c841609d9b45ab4.1386023329.git.yann.morin.1998@free.fr>
Message-ID: <20131206103817.3388512a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  2 Dec 2013 23:29:55 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> We do not properly support uninstalling packages, so just remove
> the uninstall commands.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/lvm2/lvm2.mk | 10 ----------
>  1 file changed, 10 deletions(-)

I've marked this patch as superseded in patchwork, since all uninstall
commands have been deleted by Thomas DS patch, including the lvm2 one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
