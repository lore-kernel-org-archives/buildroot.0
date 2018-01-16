From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:44:30 +0100
Subject: [Buildroot] [PATCH] libsepol: add patch to make the build
 process more standard
In-Reply-To: <20180116082218.8546-1-marcus.folkesson@gmail.com>
References: <20180116082218.8546-1-marcus.folkesson@gmail.com>
Message-ID: <20180116234430.3929460f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 09:22:18 +0100, Marcus Folkesson wrote:
> Patch the Makefiles to make PREFIX and DESTDIR follow standard
> semantics to get rid of DESTDIR during compile time in
> libsepol.mk and generate proper pkg-config files.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  ...build-follow-standard-semantics-for-DESTD.patch | 109 +++++++++++++++++++++
>  ...c-only.patch => 0003-support-static-only.patch} |  33 +++----
>  ...elative.patch => 0004-revert-ln-relative.patch} |  25 ++---
>  package/libsepol/libsepol.mk                       |   5 +-
>  4 files changed, 131 insertions(+), 41 deletions(-)
>  create mode 100644 package/libsepol/0001-libsepol-build-follow-standard-semantics-for-DESTD.patch
>  rename package/libsepol/{0001-support-static-only.patch => 0003-support-static-only.patch} (57%)
>  rename package/libsepol/{0003-revert-ln-relative.patch => 0004-revert-ln-relative.patch} (54%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
