From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 22:55:05 +0200
Subject: [Buildroot] [PATCH 1/2] python-webpy: needs hashlib support in
 python
In-Reply-To: <20180404155132.17500-1-peter@korsgaard.com>
References: <20180404155132.17500-1-peter@korsgaard.com>
Message-ID: <20180404225505.3e3f448f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Apr 2018 17:51:31 +0200, Peter Korsgaard wrote:
> webpy uses hashlib for session handling, so ensure it is available:
> 
> web/session.py:    import hashlib
> web/session.py:    sha1 = hashlib.sha1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-webpy/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
