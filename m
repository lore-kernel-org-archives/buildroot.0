From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 10:54:46 +0200
Subject: [Buildroot] [PATCH v2/next 2/4] woff2: new package
In-Reply-To: <20180323185942.60252-3-aperez@igalia.com>
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-3-aperez@igalia.com>
Message-ID: <20180509105446.204b06e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

On Fri, 23 Mar 2018 20:59:40 +0200, Adrian Perez de Castro wrote:
> Add the woff2 package to Builroot. This is needed by webkitgtk from
> version 2.20.0 onwards. WebKitGTK+ used to bundle a copy of the library,
> but it stopped doing so now that the upstream is has been making
> releases.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

This package causes a build failure on m68k:

  http://autobuild.buildroot.net/results/78d/78d25015ac464c985e5a550ce9a80d85080dc6f2/build-end.log

  http://autobuild.buildroot.net/?reason=woff2-1.0.2

It's a compiler issue. It would be nice to investigate whether it has
been fixed in newer versions of gcc, if a workaround or fix is possible.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
