From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 23:27:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/lxc: fix build without SSP
In-Reply-To: <20191111220658.9741-1-fontaine.fabrice@gmail.com>
References: <20191111220658.9741-1-fontaine.fabrice@gmail.com>
Message-ID: <20191118232727.1a4e91a3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Nov 2019 23:06:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/57945f54ffbc5c8764b6891a4516c4907e56ab97
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...c-fix-build-on-toolchain-without-SSP.patch | 36 +++++++++++++++++++
>  package/lxc/lxc.mk                            |  2 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 package/lxc/0002-configure.ac-fix-build-on-toolchain-without-SSP.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
