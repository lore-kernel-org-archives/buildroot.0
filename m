From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 24 Nov 2015 15:10:41 +0000
Subject: [Buildroot] [PATCH 2/7] toolchain-external: bump CodeSourcery
 AMD64 to 2015.11
In-Reply-To: <1448123780-30067-2-git-send-email-romain.naour@openwide.fr>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
 <1448123780-30067-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <56547DF1.8060901@imgtec.com>
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
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build a minimal rootfs using that toolchain after applying this patch.

Also checked the hash file is correct:

amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2: OK
(sha256: cb4d071db8aefb8005fe72824b96568d93a50f5acd85bacf505a34fe2f265f70)

Regards,

Vincent.
