From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:44:35 +0100
Subject: [Buildroot] [PATCH] libsemanage: add patch to make the build
 process more standard
In-Reply-To: <20180116082233.8639-1-marcus.folkesson@gmail.com>
References: <20180116082233.8639-1-marcus.folkesson@gmail.com>
Message-ID: <20180116234435.3345ecad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 09:22:33 +0100, Marcus Folkesson wrote:
> Patch the Makefiles to make PREFIX and DESTDIR follow standard
> semantics to get rid of DESTDIR during compile time in
> libsemanage.mk and generate proper pkg-config files.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  ...build-follow-standard-semantics-for-DESTD.patch | 118 +++++++++++++++++++++
>  package/libsemanage/libsemanage.mk                 |   6 +-
>  2 files changed, 119 insertions(+), 5 deletions(-)
>  create mode 100644 package/libsemanage/0002-libsemanage-build-follow-standard-semantics-for-DESTD.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
