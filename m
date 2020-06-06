From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 21:28:00 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdk-pixbuf: add
 gobject-introspection support
In-Reply-To: <20200606083438.1317261-1-fontaine.fabrice@gmail.com>
References: <20200606083438.1317261-1-fontaine.fabrice@gmail.com>
Message-ID: <20200606212800.126f7a81@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  6 Jun 2020 10:34:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This will fix the following build failure when enabling introspection on
> libgtk2:
> 
> Couldn't find include 'GdkPixbuf-2.0.gir' (search path: '['/tmp/instance-0/output-1/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '../gdk', '/tmp/instance-0/output-1/host/share', 'gir-1.0', '/tmp/instance-0/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')
> 
> Fixes:
>  - http://autobuild.buildroot.org/results//86c6f55e0bd1a0fe3b70c9e97193aaad94d72a7f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gdk-pixbuf/gdk-pixbuf.mk | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
