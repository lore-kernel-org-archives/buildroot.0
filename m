From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 May 2018 20:29:07 +0200
Subject: [Buildroot] Automatic module loading with mdev is broken?
In-Reply-To: <CAFr9PXm5zesAipczyMhEkxXFN+pi691aZSvpZHxAz1VwKv22Dw@mail.gmail.com>
 (Daniel Palmer's message of "Mon, 7 May 2018 18:40:07 +0900")
References: <CAFr9PX=M4VCMcakZsENMXBW8Xi3BcKkrVCTdARu=nCvK-A5ovg@mail.gmail.com>
 <87sh74nevl.fsf@dell.be.48ers.dk>
 <CAFr9PX=ddYhUua7VTCDTBBsPWDzmV-F3xWy2VcxKf_ko7cdQSA@mail.gmail.com>
 <87lgcvonin.fsf@dell.be.48ers.dk>
 <CAFr9PXm5zesAipczyMhEkxXFN+pi691aZSvpZHxAz1VwKv22Dw@mail.gmail.com>
Message-ID: <87h8njnwuk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Palmer <daniel@0x0f.com> writes:

 > Hi Peter,
 > I found one of my systems that actually has this module loaded:

 > daniel at espressobin2:/sys/devices/platform/Fixed MDIO bus.0$ cat modalias
 > platform:Fixed MDIO bus

 > So I think we do need the tr fix.

Ok :/ - Lets then add a tr '\n' '\0' between sort and xargs -0.

-- 
Bye, Peter Korsgaard
