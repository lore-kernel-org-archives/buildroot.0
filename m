From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 7 Jan 2020 21:31:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix gallium nouveau
 driver with gcc 4.9
In-Reply-To: <20191229092414.85255-1-fontaine.fabrice@gmail.com>
References: <20191229092414.85255-1-fontaine.fabrice@gmail.com>
Message-ID: <20200107213110.49688dc3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Dec 2019 10:24:14 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/599dc3478ed65d36fbf9f5e9625691dfa813b530
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ers-nouveau-codegen-nv50_ir_ra.cpp-p.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/mesa3d/0005-src-gallium-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
