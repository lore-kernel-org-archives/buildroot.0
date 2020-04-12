From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 12:28:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/open-lldp: bump version to
 b71bfb87fefb31c4b1a6a7ae351791c90966c3a8
In-Reply-To: <20200411172706.861234-1-fontaine.fabrice@gmail.com>
References: <20200411172706.861234-1-fontaine.fabrice@gmail.com>
Message-ID: <20200412122827.49583b5f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 19:27:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch site to github
> - Remove first patch (already in version)
> - Update second patch
> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ions-work-with-both-gnu11-and-gnu89.patch} | 27 +++----------------
>  ...tool-fixed-compile-error-for-getline.patch | 27 -------------------
>  ... => 0002-Makefile.am-disable-Werror.patch} |  0
>  ...ch => 0003-fixed-unknown-type-pid_t.patch} |  1 +
>  package/open-lldp/Config.in                   |  2 +-
>  package/open-lldp/open-lldp.hash              |  4 +--
>  package/open-lldp/open-lldp.mk                |  4 +--
>  7 files changed, 9 insertions(+), 56 deletions(-)
>  rename package/open-lldp/{0002-get-inline-functions-work-with-both-gnu11-and-gnu89.patch => 0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch} (64%)
>  delete mode 100644 package/open-lldp/0001-vdptool-fixed-compile-error-for-getline.patch
>  rename package/open-lldp/{0003-Makefile.am-disable-Werror.patch => 0002-Makefile.am-disable-Werror.patch} (100%)
>  rename package/open-lldp/{0004-fixed-unknown-type-pid_t.patch => 0003-fixed-unknown-type-pid_t.patch} (94%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
