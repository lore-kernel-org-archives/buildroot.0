From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 10:10:06 +0100
Subject: [Buildroot] [PATCH] imx-m4fwloader: new package
In-Reply-To: <20180129085024.GA9423@t450s.lan> (Gary Bisson's message of "Mon, 
 29 Jan 2018 09:50:24 +0100")
References: <20180124171050.11445-1-gary.bisson@boundarydevices.com>
 <87inbmfjp5.fsf@dell.be.48ers.dk> <20180129085024.GA9423@t450s.lan>
Message-ID: <877es181zl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

Hi,

>> What about the the m4's on mx8? It doesn't look supported yet though.

 > Exactly, the version will be bumped once i.MX8 will be supported. At
 > that point the dependency will be updated too.

Ok.

 > Anyway the whole freescale-imx folder will need an upgrade to support
 > i.MX8 properly.

 > Maybe we should create a BR2_PACKAGE_FREESCALE_IMX_HAS_M4 macro so that
 > the package only appears when a supported platform is selected.

Makes sense if the list of variants gets too big / needs to be repeated
several times.


 >> Committed with these fixes, thanks.

 > Thank you!

You're welcome!

-- 
Bye, Peter Korsgaard
