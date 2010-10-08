From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Fri, 8 Oct 2010 09:28:02 +0100
Subject: [Buildroot] buildroot not support c++ compliing
In-Reply-To: <1286525870.3703.16.camel@olyvine-desktop.logiways-sz.cn>
References: <1286511827.3703.11.camel@olyvine-desktop.logiways-sz.cn><20101008091844.1afdb502@surf>
	<1286525870.3703.16.camel@olyvine-desktop.logiways-sz.cn>
Message-ID: <AB12B32E73474741A2C5361C433A44DE022FA7A4@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Olyvine,

> > Which external toolchain are you using ?
> >
> > Thomas
> 
> STLinux's sh4-linux-

I'm using CodeSourcery's sh4 toolchain for Renesas devices, this works fine
for me. It might be worth trying it:
http://www.codesourcery.com/sgpp/lite/superh

Phil
