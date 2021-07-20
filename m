From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:44:12 +0200
Subject: [Buildroot] [PATCH next] package/strace: bump to version 5.12
In-Reply-To: <0c9146933584e404a875a2bd2867bfe9187a25a0.1622117394.git.baruch@tkos.co.il>
References: <0c9146933584e404a875a2bd2867bfe9187a25a0.1622117394.git.baruch@tkos.co.il>
Message-ID: <20210720214412.2be7b408@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 27 May 2021 15:09:54 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Drop upstream patch.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...et_syscall_info-disable_ptrace_getre.patch | 33 -------------------
>  package/strace/strace.hash                    |  4 +--
>  package/strace/strace.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 36 deletions(-)
>  delete mode 100644 package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
