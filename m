From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 21:51:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/evemu: fix build with kernels
 >= 4.16
In-Reply-To: <20200324191212.2625-1-fontaine.fabrice@gmail.com>
References: <20200324191212.2625-1-fontaine.fabrice@gmail.com>
Message-ID: <20200324215151.0bd1a209@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Mar 2020 20:12:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/487dd5056ec0a977d55b23417d5db2664dcc91fa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0002-evemu-Update-struct-input_event.patch | 110 ++++++++++++++++++
>  ...-evemu.c-fix-build-with-kernels-4.16.patch |  52 +++++++++
>  ...-evemu.c-fix-build-with-kernels-4.16.patch |  47 ++++++++
>  3 files changed, 209 insertions(+)
>  create mode 100644 package/evemu/0002-evemu-Update-struct-input_event.patch
>  create mode 100644 package/evemu/0003-src-evemu.c-fix-build-with-kernels-4.16.patch
>  create mode 100644 package/evemu/0004-src-evemu.c-fix-build-with-kernels-4.16.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
