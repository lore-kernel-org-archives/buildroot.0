From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 18 Jun 2020 09:01:36 +0200
Subject: [Buildroot] rm_work
Message-ID: <7d1c3ddd-3d77-0edd-6f7e-7e574a728ad7@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I want to build my Buildroot-BSP in a RAMdisk, but there is not enough
space for the build directory. Is it possible to free the build
resources immediately after the package has been build, installed and
deployed, similar to Yocto's "rm_work". At least I didn't find an option
in the "Build Options" menu. Could such a feature be implemented easily?

Wolfgang
