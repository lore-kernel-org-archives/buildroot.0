From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:42:38 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libmicrohttpd: remove
 dependency on threads
In-Reply-To: <20200327185045.578048-1-bernd.kuhls@t-online.de>
References: <20200327185045.578048-1-bernd.kuhls@t-online.de>
Message-ID: <20200329154238.6fd24a66@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Mar 2020 19:50:45 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream added support for non-threaded builds:
> https://git.gnunet.org/libmicrohttpd.git/commit/configure.ac?id=0eefd20ba370509d93fb7b0220e6d1c5739efac5
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: removed _REENTRANT hack (Thomas)
>     updated patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
