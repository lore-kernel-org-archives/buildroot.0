From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 12:50:48 +0200
Subject: [Buildroot] [PATCH] autobuild-run: Do not build rt-test with
 external MIPS uClibc
In-Reply-To: <38121FAB319C3344930C920E7B51831320FD40F1@LEMAIL01.le.imgtec.org>
References: <38121FAB319C3344930C920E7B51831320FD40F1@LEMAIL01.le.imgtec.org>
Message-ID: <20141012125048.0a07baad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Olivert Riera,

On Sun, 12 Oct 2014 08:35:07 +0000, Vincent Olivert Riera wrote:
> We do not allow some external MIPS uClibc toolchains to build the
> rt-tests package because they do not have the necessary fixes applied.
> 
> Related:
>   http://git.buildroot.net/buildroot/commit/?id=af9d0442cdc8d10e1be55beb02d422194c94a6f9
>   http://git.buildroot.net/buildroot/commit/?id=a47d19d41055da20139d532a253108e9b17c7950
>   http://git.buildroot.net/buildroot/commit/?id=398e590e2d55668e9ef7420cc274f0afdd174684
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  scripts/autobuild-run | 8 ++++++++
>  1 file changed, 8 insertions(+)

Thanks, applied.

Peter, Maxime, Nathaniel, Richard, please remember to update your
autobuild-run script to take into account this change.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
