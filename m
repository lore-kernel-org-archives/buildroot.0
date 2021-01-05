From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jan 2021 22:48:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/olsr: add pud plugin
In-Reply-To: <20200118163618.662596-1-fontaine.fabrice@gmail.com>
References: <20200118163618.662596-1-fontaine.fabrice@gmail.com>
Message-ID: <20210105224822.1c7249f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Jan 2020 17:36:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pud plugin needs gpsd and has a specific license
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-lib-pud-Makefile-fix-parallel-build.patch | 33 +++++++++++++++++++
>  package/olsr/olsr.mk                          | 11 +++++--
>  2 files changed, 42 insertions(+), 2 deletions(-)
>  create mode 100644 package/olsr/0001-lib-pud-Makefile-fix-parallel-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
