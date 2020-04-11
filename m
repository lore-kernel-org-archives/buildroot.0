From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:31:23 +0200
Subject: [Buildroot] [PATCH v1 1/5] package/python-flask: remove
 erroneously python-lxml dependency
In-Reply-To: <20200408204828.998-1-ps.report@gmx.net>
References: <20200408204828.998-1-ps.report@gmx.net>
Message-ID: <20200411103123.3f1e4d53@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Apr 2020 22:48:24 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Remove erroneously python-lxml dependency (as noted by
> Peter Korsgaard).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/python-flask/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
