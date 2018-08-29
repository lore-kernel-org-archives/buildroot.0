From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Aug 2018 15:43:26 +0200
Subject: [Buildroot] [PATCH] mender: fix ioctl build failure on
 powerpc64le / power8
In-Reply-To: <CADHdJwB5de-iSdVtbFGP0dLVoS0hFacewWAGf8rioEyLZZWJtQ@mail.gmail.com>
 (Mirza Krak's message of "Wed, 29 Aug 2018 11:56:46 +0200")
References: <20180828170153.42156-1-giulio.benetti@micronovasrl.com>
 <CADHdJwDAnbFAe3bGTQswK1OdfQzN+JCCwCPLGhLy1MCmz0bBTQ@mail.gmail.com>
 <fa955ebd-e988-0bb2-f506-ca164477b34f@micronovasrl.com>
 <20180828215714.5e2c7c84@windsurf.home>
 <451277c2-effe-1d73-f2b3-9c2daf59c2c0@micronovasrl.com>
 <CA+_SqVZ0B7mH+fou8=V9b4PfWbxeN-WFRtuaG=-GAWDGXLoe6Q@mail.gmail.com>
 <87o9dl4ocb.fsf@dell.be.48ers.dk>
 <d58ec644-5421-bfcc-d209-1ba11e6d3f87@micronovasrl.com>
 <CADHdJwB5de-iSdVtbFGP0dLVoS0hFacewWAGf8rioEyLZZWJtQ@mail.gmail.com>
Message-ID: <877ek947b5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mirza" == Mirza Krak <mirza.krak@northern.tech> writes:

Hi,

 >>> Ok, if it indeed is a "short time", we are very close to releasing
 >>> 2018.08.

 > Providing some basis for a easier decision (sorry if it is a bit late
 > and might add confusion)

 > The options are (all fix the build error for ppc64le):

 > - Backport fix for the build failure (v2 sent by Giulio)
 > - Bump package to 1.5.0 (existing release)
 > - Bump package to 1.6.0 (in process of being released 1-2 weeks)

 > If it acceptable to bump the package I/or someone else could bump it
 > to 1.5.0 right now or wait 1-2 weeks for 1.6.0. Otherwise backport
 > patch and bump to 1.6.0 once it is released (guessing that this would
 > be after 2018.08 release, do not know what "very close" means :)).

Thanks for the overview. As mender is new in 2018.08, both option 1 and
2 could work, but given we already have option 1 ready I will commit
that.

Patches for option 2 (and 3 once released) are as always welcome.

-- 
Bye, Peter Korsgaard
