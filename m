From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 12:32:23 +0100
Subject: [Buildroot] [PATCH] autobuild-run: Do not build strace with
 outdated MIPS uClibc toolchains
In-Reply-To: <1422875765-14884-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1422875765-14884-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150202123223.76bc581c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 2 Feb 2015 11:16:05 +0000, Vicente Olivert Riera wrote:
> These two MIPS uClibc toolchains don't include an upstream patch to fix
> a compilation failure of strace-4.9+, so better to prevent the selection
> of the strace package when using these toolchains.
> 
> Related:
>   http://git.uclibc.org/uClibc/commit/?id=a1b88fe87a9d2be5696247d266f5c4fd20f000bb
> 
>   http://git.buildroot.net/buildroot/commit/?id=8deb5725577a104f4c1e1a569af9675514e13772
>   http://git.buildroot.net/buildroot/commit/?id=7b5ff1ab8ae6c9de6e8f6c0355d80255ae344efe
> 
>   http://lists.busybox.net/pipermail/buildroot/2015-February/118362.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  scripts/autobuild-run |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)

Applied to buildroot-test.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
