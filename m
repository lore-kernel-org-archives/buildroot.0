From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:31:28 +0200
Subject: [Buildroot] [PATCH] package/python-crossbar: needs cbor2
In-Reply-To: <20200421061115.1218789-1-thomas.petazzoni@bootlin.com>
References: <20200421061115.1218789-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200421223128.5732895e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 08:11:14 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Since upstream commit 71f81bf83d3a1d4c564131ed7408f4d7ffe79242, cbor2
> is needed by crossbar. This commit first appeared in crossbar release
> v19.3.1, which means it is needed since the version bump that took
> place in Buildroot commit 44a9f390efc282f41052b39716eab04cd76b1680.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/517918425
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/python-crossbar/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
