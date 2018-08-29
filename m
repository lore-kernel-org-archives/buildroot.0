From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Aug 2018 09:35:32 +0200
Subject: [Buildroot] [PATCH] mender: fix ioctl build failure on
 powerpc64le / power8
In-Reply-To: <CA+_SqVZ0B7mH+fou8=V9b4PfWbxeN-WFRtuaG=-GAWDGXLoe6Q@mail.gmail.com>
 (Angelo Compagnucci's message of "Wed, 29 Aug 2018 07:44:37 +0200")
References: <20180828170153.42156-1-giulio.benetti@micronovasrl.com>
 <CADHdJwDAnbFAe3bGTQswK1OdfQzN+JCCwCPLGhLy1MCmz0bBTQ@mail.gmail.com>
 <fa955ebd-e988-0bb2-f506-ca164477b34f@micronovasrl.com>
 <20180828215714.5e2c7c84@windsurf.home>
 <451277c2-effe-1d73-f2b3-9c2daf59c2c0@micronovasrl.com>
 <CA+_SqVZ0B7mH+fou8=V9b4PfWbxeN-WFRtuaG=-GAWDGXLoe6Q@mail.gmail.com>
Message-ID: <87o9dl4ocb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

Hi,

 >> Sure, I will use the upstream one I've missed when searching.

 > Mizra, one of the authors of Mender is releasing a bump of the package
 > with other fixes. We agreed on waiting on the package bump to fix the
 > error instead of carrying a patch in buildroot that will bu useful
 > only for a short period of time.

Ok, if it indeed is a "short time", we are very close to releasing
2018.08.

-- 
Bye, Peter Korsgaard
