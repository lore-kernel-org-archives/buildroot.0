From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 16 Nov 2017 08:29:49 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <58b8ef53-75b6-fc8b-8d37-e21570ae4e3b@mind.be>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
 <20171113144231.gddccsqlelrhrokw@dell5510>
 <20171114234409.114f002f@gmx.net>
 <20171115125857.dcy6j7qvjt32ww43@dell5510>
 <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
 <20171116001919.67e98b4b@gmx.net>
 <58b8ef53-75b6-fc8b-8d37-e21570ae4e3b@mind.be>
Message-ID: <20171116072948.smctbcvxwkxgqoah@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

...
> > make[1]: *** No rule to make target 'toolchain-external-custom', needed by '.../build-prebuild-toolchain-001/build/toolchain-external/.stamp_configured'.  Stop.
> > make: *** [Makefile:16: _all] Error 2

> > The error occurs  before the prebuild toolchain is downloaded/extracted...

>  That is really weird, the toolchain-external-custom dependencies should be
> defined no matter what... Could you pastebin the output make 'make -qp' somewhere?
Here it is:
http://sipe.cz/buildroot/out.log (68M)
http://sipe.cz/buildroot/out.log.tar.gz (9MB)


Kind regards,
Petr
