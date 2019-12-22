From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:36:50 +0100
Subject: [Buildroot] [PATCH] support/download/svn: generate reproducible
 svn archives
In-Reply-To: <20191222213148.13762-1-heiko.thiery@gmail.com>
References: <20191222213148.13762-1-heiko.thiery@gmail.com>
Message-ID: <20191222223650.1f44d3ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 22:31:49 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> To generate a reproducible archive from a svn repository mainly the same
> aproach is done like for the archives from a git repository.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Thanks. Could you check whether the tarballs that are now produced by
this are identical to the tarballs we already have on
sources.buildroot.org ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
