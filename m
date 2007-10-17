From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 17 Oct 2007 11:22:40 +1000
Subject: [Buildroot] patch: packages/mpfr fails to build
In-Reply-To: <20071015020450.GA1526@cloud.net.au>
References: <20071015020450.GA1526@cloud.net.au>
Message-ID: <20071017012240.GA27413@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 15, 2007 at 12:04:50PM +1000, Hamish Moffatt wrote:
> The mpfr package now fails to build due to the odd format of the upstream
> mpfr patches file. Upstream recommends using "patch -p1 -N -Z", so here
> is a patch to make buildroot do this.

Appears that this is only required with the ancient version of patch I
had in my $PATH. With latest version there is no issue with upstream's
patch.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
