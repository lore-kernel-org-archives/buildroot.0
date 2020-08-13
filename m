From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:27:44 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/rtl8821au: add patch fixing
 sprintf error
In-Reply-To: <20200808173800.2034897-1-christian@paral.in>
References: <20200808173800.2034897-1-christian@paral.in>
Message-ID: <20200813232744.12d34e1b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  8 Aug 2020 10:38:00 -0700
Christian Stewart <christian@paral.in> wrote:

> Fixes compile errors against certain kernels.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks. I have to say the snippet of code that is
being patched here does not give a very good feel of the rtl8821au
code base :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
