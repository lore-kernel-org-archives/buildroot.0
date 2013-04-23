From: Daiane Angolini <daiane.angolini@freescale.com>
Date: Tue, 23 Apr 2013 10:03:46 -0300
Subject: [Buildroot] linux/videodev.h missing
In-Reply-To: <BA6FC03EA0815D428FB8A3C279ED4992072B9210@mx.toyon.corp>
References: <BA6FC03EA0815D428FB8A3C279ED4992072B8ECF@mx.toyon.corp>
 <5171D9E4.7090904@mind.be>
 <BA6FC03EA0815D428FB8A3C279ED4992072B900D@mx.toyon.corp>
 <5175A1C6.1050106@mind.be>
 <BA6FC03EA0815D428FB8A3C279ED4992072B9210@mx.toyon.corp>
Message-ID: <517686B2.407@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/2013 07:28 PM, Richard Cagley wrote:
> Sadly, even freescale seems to have dropped videodev.h
> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/include
> /linux

Which kernel version and imx-lib version are you using?

When I worked with kernel and imx-lib 11.09.01 I patched imx-lib in 
order to avoid this videodev.h include.

I don't remember exactly what I used, it should be something like 
videodev2.h or video2dev.h


Daiane
