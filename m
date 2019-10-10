From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 09:29:22 +0200
Subject: [Buildroot] [PATCH 1/1] scanpypi: write every license file once
In-Reply-To: <CAGm1_kvXJGA0VYoC86zGLxRk405K3LDmwJ=9B=UDxvm+25+Dxw@mail.gmail.com>
References: <20191008090404.26700-1-asafka7@gmail.com>
 <20191008090404.26700-2-asafka7@gmail.com>
 <20191008232209.254e3c0d@windsurf>
 <CAGm1_kvXJGA0VYoC86zGLxRk405K3LDmwJ=9B=UDxvm+25+Dxw@mail.gmail.com>
Message-ID: <20191010092922.1b124a28@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

On Wed, 9 Oct 2019 19:36:23 +0200
Yegor Yefremov <yegorslists@googlemail.com> wrote:

> > There are two checks to see if the manual gpio is configured, but
> > these the check is seeing if the structure is NULL instead it
> > should check to see if there are CTS and/or RTS pins defined.
> >
> > This patch uses checks for those individual pins instead of
> > checking for the structure itself to restore auto RTS/CTS.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>  

Is that a bad copy/paste ? It seems like you were working on some
serial port kernel commits at the same time, isn't it ? :-)

> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Anyway, thanks for the review! :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
