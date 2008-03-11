From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 12 Mar 2008 10:22:34 +1100
Subject: [Buildroot] [buildroot 0002514]: fakeroot has an invalid	version
In-Reply-To: <d6cda7730803110655i42ba1d12pd0253344bec51e10@mail.gmail.com>
References: <3602fa0f2bfc9d33e7fe0380c3243a05@busybox.net>
	<d6cda7730803102151k687bc79ek9117e63ae3241dc8@mail.gmail.com>
	<1205216050.8434.14.camel@localhost>
	<46a136670803110638j36c03d7eo5f83f200f5cd7246@mail.gmail.com>
	<d6cda7730803110655i42ba1d12pd0253344bec51e10@mail.gmail.com>
Message-ID: <20080311232234.GA10859@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 11, 2008 at 10:55:24AM -0300, Thiago A. Corr?a wrote:
> John,
> 
>    What I'm rumbling about is that in no less than 1 or 2 months we
> will be forced to change it again, just because someone at debian
> decided that they wouldn't host an older version anymore. This is
> quite constant with the packages that download from there.

Please don't suggest malicious intent from Debian where none exists. The
Debian package pool (http://ftp.debian.org/debian/pool/... and mirrors)
effectively uses garbage collection; versions of packages are
automatically removed when they are no longer the current version in 
the 'stable', 'unstable' or 'testing' distributions.

One way to stabilise the fakeroot package would be to use the version
from stable, unless we particularly need features from the new version.
That version is 1.5.10. stable only changes every couple of years other
than for security updates.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
