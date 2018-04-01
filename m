From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 07:54:26 +0200
Subject: [Buildroot] [PATCH] utils/scanpypi: don't hardcode python2
In-Reply-To: <20180330214807.6135-1-peter@korsgaard.com>
References: <20180330214807.6135-1-peter@korsgaard.com>
Message-ID: <20180401075426.3576abb5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Mar 2018 23:48:07 +0200, Peter Korsgaard wrote:
> Commit 3a0c20c5309b (scanpypi: add support for Python3) adapted the script
> to work with python 3.x, but the shebang still said python2 making it
> unlikely to work on systems without python 2.x.
> 
> Change it to just 'python' instead.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  utils/scanpypi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
