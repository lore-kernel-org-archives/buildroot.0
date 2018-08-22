From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 15:34:13 +0200
Subject: [Buildroot] [PATCH next 2/2] linux-headers: bump 4.{4, 9, 14, 17,
 18}.x series
In-Reply-To: <1534941838-24924-2-git-send-email-festevam@gmail.com>
References: <1534941838-24924-1-git-send-email-festevam@gmail.com>
 <1534941838-24924-2-git-send-email-festevam@gmail.com>
Message-ID: <20180822153413.0a775445@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Aug 2018 09:43:58 -0300, Fabio Estevam wrote:
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/linux-headers/Config.in.host | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Please split this one into two: one for master, and one for next.
Indeed, in master, we want to bump the 4.{9,14,17} versions, but we
don't have 4.18 there.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
