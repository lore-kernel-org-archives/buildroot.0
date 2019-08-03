From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 10:52:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/checksec: bump to version 2.1.0
In-Reply-To: <20190803073611.9465-1-fontaine.fabrice@gmail.com>
References: <20190803073611.9465-1-fontaine.fabrice@gmail.com>
Message-ID: <20190803105242.0b794cb5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Aug 2019 09:36:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove patch, it does not seem to be needed anymore as issue was not
> reproduced (see https://github.com/slimm609/checksec.sh/issues/54)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...cksec-Fixed-issue-with-relative-path.patch | 43 -------------------
>  package/checksec/checksec.hash                |  2 +-
>  package/checksec/checksec.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 45 deletions(-)
>  delete mode 100644 package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
