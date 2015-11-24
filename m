From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 24 Nov 2015 15:16:33 +0000
Subject: [Buildroot] [PATCH 3/7] toolchain-external: CodeSourcery
 NIOSII: support only one version
In-Reply-To: <1448123780-30067-3-git-send-email-romain.naour@openwide.fr>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
 <1448123780-30067-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <56547F51.8020509@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On 21/11/15 16:36, Romain Naour wrote:
> See the conclusion about external toolchains during the Buildroot
> meeting [1]:
> "In the future, we stick to a single external toolchain version. The
> Kconfig symbol should not encode the version (avoid legacy handling)"
> 
> [1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build a minimal rootfs using that toolchain after applying this patch.

Regards,

Vincent.
