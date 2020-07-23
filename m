From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 16:35:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11vnc: fix build with 64 bits
 time_t
In-Reply-To: <20200721200940.2775422-1-fontaine.fabrice@gmail.com>
References: <20200721200940.2775422-1-fontaine.fabrice@gmail.com>
Message-ID: <20200723163548.2c34de7d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Jul 2020 22:09:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/75e45b566c85d19c5ed00529d036b4808413b1ca
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ld-on-32bit-arches-with-64bit-time_t.patch | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
