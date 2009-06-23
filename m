From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 23 Jun 2009 10:13:38 +0200
Subject: [Buildroot] [git commit] CHANGES: add resolved issues
 post-2009.05
In-Reply-To: <20090623074118.9DD1E76268@busybox.osuosl.org>
References: <20090623074118.9DD1E76268@busybox.osuosl.org>
Message-ID: <1245744818.3774.4.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2009-06-23 at 09:40 +0200, Peter Korsgaard wrote:

> +	Issues resolved (http://bugs.uclibc.org):
> +
> +	#241: device mapper + lvm2: build together
> +	#367: linux kernel compile error for arm926t
> +	#373: Support for building gstreamer without libxml
> +	#383: gst-plugins-good: Allow soup plugin to be configured
> +	#385: neon: Fix pkgconfig dependency
> +	#391: gstreamer: Bump version to 0.10.23
> +	#393: gst-plugins-base: Bump version to 0.10.23
> +	#395: gst-plugins-bad: New package
> +	#409: Bump php package to 5.2.10
> +	#411: ipsec-tools: Bump version to 0.7.2

That's a nice list already. Perhaps also add these two low hanging
fruits:

  https://bugs.uclibc.org/show_bug.cgi?id=349
  Bug 349  update libsoup to version 2.26.2

  https://bugs.uclibc.org/show_bug.cgi?id=379
  Bug 379  update DirectFB to version 1.4.0


If someone else than me is interested in getting libsmbclient into
buildroot, please try the patch attached to bug 301. This could need
some more work before it can be considered ready for inclusion in
buildroot. But it would also allow to solve bug 303 (addition of gvfs
package).

 
Sven
