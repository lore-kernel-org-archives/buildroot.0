From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 15:56:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/tslib: fix build with headers
 >= 4.16
In-Reply-To: <20200311201749.374631-1-fontaine.fabrice@gmail.com>
References: <20200311201749.374631-1-fontaine.fabrice@gmail.com>
Message-ID: <20200322155622.669801e4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Mar 2020 21:17:49 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/bc8bc3f1d88f3b64765025fee7f941d30a81ee46
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ld-on-32bit-arches-with-64bit-time_t.patch | 386 ++++++++++++++++++
>  1 file changed, 386 insertions(+)
>  create mode 100644 package/tslib/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
