From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 23:07:39 +0100
Subject: [Buildroot] [PATCH] package/tinyproxy: new package
In-Reply-To: <20200314102323.1781-1-alexander.i.mukhin@gmail.com>
References: <20200313220548.666cb3ef@gmx.net>
 <20200314102323.1781-1-alexander.i.mukhin@gmail.com>
Message-ID: <20200315230739.67c238b5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Mar 2020 13:23:23 +0300
Alexander Mukhin <alexander.i.mukhin@gmail.com> wrote:

> Tinyproxy is a small, efficient HTTP/SSL proxy daemon.
> 
> https://tinyproxy.github.io
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> ---
>  DEVELOPERS                                    |  3 +++
>  package/Config.in                             |  1 +
>  .../0001-Makefile.am-remove-docs-subdir.patch | 27 +++++++++++++++++++
>  package/tinyproxy/Config.in                   | 16 +++++++++++
>  package/tinyproxy/tinyproxy.hash              |  2 ++
>  package/tinyproxy/tinyproxy.mk                | 15 +++++++++++
>  6 files changed, 64 insertions(+)
>  create mode 100644 package/tinyproxy/0001-Makefile.am-remove-docs-subdir.patch
>  create mode 100644 package/tinyproxy/Config.in
>  create mode 100644 package/tinyproxy/tinyproxy.hash
>  create mode 100644 package/tinyproxy/tinyproxy.mk

Applied to master, thanks. Thanks Peter Seiderer for the review.

Alexander: could you submit a patch upstream that adds --disable-doc
option, or that detects the availability of asciidoc before building
the documentation ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
