From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 7 May 2018 18:40:07 +0900
Subject: [Buildroot] Automatic module loading with mdev is broken?
In-Reply-To: <87lgcvonin.fsf@dell.be.48ers.dk>
References: <CAFr9PX=M4VCMcakZsENMXBW8Xi3BcKkrVCTdARu=nCvK-A5ovg@mail.gmail.com>
 <87sh74nevl.fsf@dell.be.48ers.dk>
 <CAFr9PX=ddYhUua7VTCDTBBsPWDzmV-F3xWy2VcxKf_ko7cdQSA@mail.gmail.com>
 <87lgcvonin.fsf@dell.be.48ers.dk>
Message-ID: <CAFr9PXm5zesAipczyMhEkxXFN+pi691aZSvpZHxAz1VwKv22Dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I found one of my systems that actually has this module loaded:

daniel at espressobin2:/sys/devices/platform/Fixed MDIO bus.0$ cat modalias
platform:Fixed MDIO bus

So I think we do need the tr fix.
