From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 15:22:00 +0100
Subject: [Buildroot] [PATCH] package/libfcgi: bump to version 2.4.2
In-Reply-To: <20191126214201.95129-1-louis.rannou@smile.fr>
References: <Re: [Buildroot] [PATCH] package/libfcgi: bump to version 2.4.2>
 <20191126214201.95129-1-louis.rannou@smile.fr>
Message-ID: <20191224152200.614b852a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 22:42:01 +0100
Louis Rannou <louis.rannou@smile.fr> wrote:

> FCGI is abandonned (https://repo.or.cz/fcgi2.git). Replace it by a maintained
> fork (https://github.com/FastCGI-Archives/fcgi2).
> 
> Patchs status:
> 0001-eof.patch -> fixed by commit 122e55cc354dd4a78849aed8d36c61ed9edeaeb2
> 0002-link-against-libfcgi-la.patch -> included in commit 2a575066bcbdadfc161d46ef816a45f6edf9d529
> 0004-make-autoreconfable.patch -> fixed in commits 854643b36e87cf1262da2eb82b3f10b56185131b and ad30485fa12be4415d57422702ee4f64a09b7bea
> 0006-fix-CVE-2012-6687.patch -> applied in commit 5c15a7bb5260bc83715090c9fd386d704c139671
> 
> Signed-off-by: Louis Rannou <louis.rannou@smile.fr>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
