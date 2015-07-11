From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 12:33:31 +0200
Subject: [Buildroot] [PATCH] binutils: fix xtensa gas segfault with
 --text-section-literals
In-Reply-To: <1432628640-29876-1-git-send-email-jcmvbkbc@gmail.com>
References: <1432628640-29876-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150711123331.03f9c605@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Tue, 26 May 2015 11:24:00 +0300, Max Filippov wrote:
> Building libgcc with TARGET_ABI flags results in assembler segfault on
> xtensa, because code in sections .init and .fini emits literals w/o
> .literal_position directive. This patch turns the segfault into assembly
> error.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...x-gas-segfault-with-text-section-literals.patch | 56 ++++++++++++++++++++++
>  ...x-gas-segfault-with-text-section-literals.patch | 56 ++++++++++++++++++++++
>  ...x-gas-segfault-with-text-section-literals.patch | 56 ++++++++++++++++++++++
>  ...x-gas-segfault-with-text-section-literals.patch | 56 ++++++++++++++++++++++
>  4 files changed, 224 insertions(+)
>  create mode 100644 package/binutils/2.22/912-xtensa-fix-gas-segfault-with-text-section-literals.patch
>  create mode 100644 package/binutils/2.23.2/912-xtensa-fix-gas-segfault-with-text-section-literals.patch
>  create mode 100644 package/binutils/2.24/912-xtensa-fix-gas-segfault-with-text-section-literals.patch
>  create mode 100644 package/binutils/2.25/912-xtensa-fix-gas-segfault-with-text-section-literals.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
