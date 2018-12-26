From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 21:24:29 +0100
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.1.0
In-Reply-To: <20181223212205.1115-1-peter@korsgaard.com>
References: <20181223212205.1115-1-peter@korsgaard.com>
Message-ID: <20181226212429.6e289e7d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Dec 2018 22:22:05 +0100, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - ASTERISK-28127: Buffer overflow for DNS SRV/NAPTR records
>   https://issues.asterisk.org/jira/browse/ASTERISK-28127
> 
> - ASTERISK-28013: res_http_websocket: Crash when reading HTTP Upgrade
>   requests
>   https://issues.asterisk.org/jira/browse/ASTERISK-28013
> 
> For more details, see the announcement:
> https://www.asterisk.org/downloads/asterisk-news/asterisk-1610-now-available
> 
> Asterisk now also contains m4 code needed to autoreconf under
> third-party/jansson, so add that to _AUTORECONF_OPTS.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/asterisk/asterisk.hash | 2 +-
>  package/asterisk/asterisk.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
