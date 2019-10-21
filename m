From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:42:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/asterisk: bump version to 16.6.1
In-Reply-To: <20191021180722.18851-1-bernd.kuhls@t-online.de>
References: <20191021180722.18851-1-bernd.kuhls@t-online.de>
Message-ID: <20191021214225.7775c93e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 20:07:21 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://www.asterisk.org/downloads/asterisk-news/asterisk-1660-now-available
> https://www.asterisk.org/downloads/asterisk-news/asterisk-1661-now-available
> 
> Updated license hash after upstream commit, no license changes:
> https://github.com/asterisk/asterisk/commit/b096389660027365efe893077b24482f84ba31ac
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/asterisk/asterisk.hash | 4 ++--
>  package/asterisk/asterisk.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied, thanks. Sad to see that you're no longer taking care of
asterisk: it's a fairly complex package, and I'm not sure if there will
be other volunteers to take care of it :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
