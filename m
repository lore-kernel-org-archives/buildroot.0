From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:47:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.5.7
In-Reply-To: <20210317065231.421826-1-bernd.kuhls@t-online.de>
References: <20210317065231.421826-1-bernd.kuhls@t-online.de>
Message-ID: <20210320224730.204412fc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Mar 2021 07:52:31 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated license hash due to upstream commit:
> https://gitweb.torproject.org/tor.git/commit/LICENSE?h=tor-0.4.5.7&id=02230575c4da6cd6342516e6682f95dad3e3e29e
> 
> Fixes CVE-2021-28089 & CVE-2021-28090.
> 
> Release notes: https://blog.torproject.org/node/2009
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
