From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 13:02:55 +0200
Subject: [Buildroot] [PATCH] libiscsi: bump version to 1.18.0
In-Reply-To: <20161016101305.53958-1-Vincent.Riera@imgtec.com>
References: <20161016101305.53958-1-Vincent.Riera@imgtec.com>
Message-ID: <20161016130255.0c1ee491@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Oct 2016 11:13:05 +0100, Vicente Olivert Riera wrote:
> Also...
> 
> - Switch to GitHub.
> - Remove LD=CC logic in libscsi.mk. This is now handled by the configure
>   script.
> - Add patch to fix unsafe include paths issues. This patch has been sent
>   upstream as a pull request.
> - Autoreconf fails. Use a hook to run autogen.sh.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...lude.-This-is-unsafe-when-cross-compiling.patch | 67 ++++++++++++++++++++++
>  package/libiscsi/libiscsi.hash                     |  2 +-
>  package/libiscsi/libiscsi.mk                       | 16 ++++--
>  3 files changed, 79 insertions(+), 6 deletions(-)
>  create mode 100644 package/libiscsi/0001-Do-not-use-I-usr-include.-This-is-unsafe-when-cross-compiling.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
