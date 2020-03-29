From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:54:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/jbig2dec: new package.
In-Reply-To: <20190913112413.31969-1-raphael.melotte@essensium.com>
References: <20190913112413.31969-1-raphael.melotte@essensium.com>
Message-ID: <20200329225409.63517cfc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 13 Sep 2019 13:24:13 +0200
raphael.melotte at essensium.com wrote:

> From: Rapha?l M?lotte <raphael.melotte@essensium.com>
> 
> jbig2dec is a decoder implementation of the JBIG2 image compression format.
> 
> Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
> ---
>  DEVELOPERS                     |  3 +++
>  package/Config.in              |  1 +
>  package/jbig2dec/Config.in     |  7 +++++++
>  package/jbig2dec/jbig2dec.hash |  7 +++++++
>  package/jbig2dec/jbig2dec.mk   | 13 +++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/jbig2dec/Config.in
>  create mode 100644 package/jbig2dec/jbig2dec.hash
>  create mode 100644 package/jbig2dec/jbig2dec.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
