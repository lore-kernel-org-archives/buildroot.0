From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 10:13:45 +0200
Subject: [Buildroot] [PATCH] pdbg: Bump to latest version
In-Reply-To: <20180912035008.28294-1-joel@jms.id.au>
References: <20180912035008.28294-1-joel@jms.id.au>
Message-ID: <20180912101345.68b53c3e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 13:20:08 +0930, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  package/pdbg/pdbg.hash | 2 +-
>  package/pdbg/pdbg.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. Ideally the commit title should give the
version to which we're bumping, especially when the version is a human
readable identifier.

I've also made a follow-up commit adding a hash for the license file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
