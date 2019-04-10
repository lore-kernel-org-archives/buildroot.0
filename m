From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:30:17 +0200
Subject: [Buildroot] [PATCH 1/1] [v2] package/freerdp: bump version to
 2.0.0-rc4
In-Reply-To: <20190407190629.5380-1-skif@skif-web.ru>
References: <20190407190629.5380-1-skif@skif-web.ru>
Message-ID: <20190410193017.23b49985@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey,

On Sun,  7 Apr 2019 22:06:29 +0300
Alexey Lukyanchuk <skif@skif-web.ru> wrote:

> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>

There should be only one Signed-off-by line at the end of the commit
log, so I dropped this one.

> 
> Add support to set tls security level (for openssl >= 1.1.0), for RDP
> protocol version 10(needed for windows 10 and windows server 2016). Also have some fix and features, see
> https://github.com/FreeRDP/FreeRDP/commit/e21b72c95f857817b4b32b5ef5406355c005a9e8
> 
> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
> ---
>  package/freerdp/freerdp.hash | 2 +-
>  package/freerdp/freerdp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
