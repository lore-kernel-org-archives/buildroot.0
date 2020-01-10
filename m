From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 23:05:34 +0100
Subject: [Buildroot] [PATCH] package/bash: update to version 5.0.11
In-Reply-To: <20200107102421.11432-1-p.debruijn@unilogic.nl>
References: <20200107102421.11432-1-p.debruijn@unilogic.nl>
Message-ID: <20200110230534.4ea199fe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  7 Jan 2020 11:24:21 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/bash/0001-bash44-019.patch |  54 ---------
>  package/bash/0001-bash50-001.patch | 166 ++++++++++++++++++++++++++
>  package/bash/0002-bash44-020.patch | 181 ----------------------------
>  package/bash/0002-bash50-002.patch | 113 ++++++++++++++++++
>  package/bash/0003-bash44-021.patch |  61 ----------
>  package/bash/0003-bash50-003.patch | 239 +++++++++++++++++++++++++++++++++++++
>  package/bash/0004-bash44-022.patch |  65 ----------
>  package/bash/0004-bash50-004.patch |  53 ++++++++
>  package/bash/0005-bash44-023.patch |  56 ---------
>  package/bash/0005-bash50-005.patch | 110 +++++++++++++++++
>  package/bash/0006-bash50-006.patch |  47 ++++++++
>  package/bash/0007-bash50-007.patch |  62 ++++++++++
>  package/bash/0008-bash50-008.patch |  68 +++++++++++
>  package/bash/0009-bash50-009.patch |  42 +++++++
>  package/bash/0010-bash50-010.patch | 172 ++++++++++++++++++++++++++
>  package/bash/0011-bash50-011.patch |  59 +++++++++
>  package/bash/bash.hash             |   2 +-
>  package/bash/bash.mk               |   2 +-
>  18 files changed, 1133 insertions(+), 419 deletions(-)
>  delete mode 100644 package/bash/0001-bash44-019.patch
>  create mode 100644 package/bash/0001-bash50-001.patch
>  delete mode 100644 package/bash/0002-bash44-020.patch
>  create mode 100644 package/bash/0002-bash50-002.patch
>  delete mode 100644 package/bash/0003-bash44-021.patch
>  create mode 100644 package/bash/0003-bash50-003.patch
>  delete mode 100644 package/bash/0004-bash44-022.patch
>  create mode 100644 package/bash/0004-bash50-004.patch
>  delete mode 100644 package/bash/0005-bash44-023.patch
>  create mode 100644 package/bash/0005-bash50-005.patch
>  create mode 100644 package/bash/0006-bash50-006.patch
>  create mode 100644 package/bash/0007-bash50-007.patch
>  create mode 100644 package/bash/0008-bash50-008.patch
>  create mode 100644 package/bash/0009-bash50-009.patch
>  create mode 100644 package/bash/0010-bash50-010.patch
>  create mode 100644 package/bash/0011-bash50-011.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
