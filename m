From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Aug 2019 16:35:29 +0200
Subject: [Buildroot] [PATCH 1/2] utils/genrandconfig: instantiate
 SystemInfo() earlier
In-Reply-To: <20190804091319.32679-1-thomas.petazzoni@bootlin.com>
References: <20190804091319.32679-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190807163529.347d05f5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Aug 2019 11:13:18 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> In a future patch, we are going to need a SystemInfo() instance in
> gen_config(), so create the SystemInfo() instance there, and pass it
> to fixup_config(), where we currently use it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  utils/genrandconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

I've applied both patches. Thanks a lot Atharva for the review and
testing, much appreciated!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
