From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 21:53:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/lightning: fix install of
 lightning.h
In-Reply-To: <20191010185045.18812-1-fontaine.fabrice@gmail.com>
References: <20191010185045.18812-1-fontaine.fabrice@gmail.com>
Message-ID: <20191010215343.0ec22399@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Oct 2019 20:50:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/05ebc75598627d2a08e08e194f51cb8464f97b95
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e.am-don-t-install-lightning.h-twice.patch | 38 +++++++++++++++++++
>  package/lightning/lightning.mk                |  2 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
