From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 29 Oct 2015 11:25:29 +0000
Subject: [Buildroot] [PATCH 3/9 v2] package/gcc: use generic extract
	commands
In-Reply-To: <225efaba40aa6a43d591eaf95539850e92beb6e3.1445690712.git.yann.morin.1998@free.fr>
References: <cover.1445690712.git.yann.morin.1998@free.fr>
 <225efaba40aa6a43d591eaf95539850e92beb6e3.1445690712.git.yann.morin.1998@free.fr>
Message-ID: <56320229.8020005@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On 10/24/2015 01:48 PM, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Buildroot internal toolchain built for MIPS architecture after applying
this patch (and the previous ones). Then the target rootfs was built
successfully using that toolchain.

Regards,

Vincent.
