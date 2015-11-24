From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 24 Nov 2015 15:22:45 +0000
Subject: [Buildroot] [PATCH 4/7] toolchain-external: bump CodeSourcery
 NIOSII to 2015.11
In-Reply-To: <1448123780-30067-4-git-send-email-romain.naour@openwide.fr>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
 <1448123780-30067-4-git-send-email-romain.naour@openwide.fr>
Message-ID: <565480C5.2030107@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On 21/11/15 16:36, Romain Naour wrote:
> Some package black list CS NIOSII toolchains, mainly due to _gp link
> issue. A follow up patch can remove the restriction case by case.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build a minimal rootfs using that toolchain after applying this patch.

Regards,

Vincent.
