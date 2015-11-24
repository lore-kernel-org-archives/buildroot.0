From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 24 Nov 2015 15:43:22 +0000
Subject: [Buildroot] [PATCH 7/7] toolchain-external: bump CodeSourcery
	MIPS to 2015.11
In-Reply-To: <1448123780-30067-7-git-send-email-romain.naour@openwide.fr>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
 <1448123780-30067-7-git-send-email-romain.naour@openwide.fr>
Message-ID: <5654859A.4000702@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On 21/11/15 16:36, Romain Naour wrote:
> Use a stronger hash.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build a minimal rootfs using that toolchain after applying this patch.

Also checked the hash value is correct:

mips-2015.11-32-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2: OK (sha256:
e653102803d0fadc0a83286400c03bc7932ab081d3f8fc8917c34e76468315a2)

Also checked the lib-names headers problem has been fixed in this version.

Regards,

Vincent.
