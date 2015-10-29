From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 29 Oct 2015 12:10:10 +0000
Subject: [Buildroot] [PATCH 9/9 v2] toolchain/external: Codescape
 toolchains also exist for x86_64
In-Reply-To: <d81c191c32f761351ec9a907feedbd47968cd1ee.1445690712.git.yann.morin.1998@free.fr>
References: <cover.1445690712.git.yann.morin.1998@free.fr>
 <d81c191c32f761351ec9a907feedbd47968cd1ee.1445690712.git.yann.morin.1998@free.fr>
Message-ID: <56320CA2.4020003@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On 10/24/2015 01:49 PM, Yann E. MORIN wrote:
> Since their prefix exactly matches our $(HOSTARCH), just use that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Built rootfs's using the four possible combinations, MTI toolchain for
x86 and x86_64, and IMG toolchain for x86 and x86_64.

Regards,

Vincent.
