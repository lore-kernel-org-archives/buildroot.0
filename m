From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Oct 2012 22:58:18 +0200
Subject: [Buildroot] Important fixes for autobuilder issues
In-Reply-To: <20121013183210.34aa681d@skate> (Thomas Petazzoni's message of
 "Sat, 13 Oct 2012 18:32:10 +0200")
References: <20121013183210.34aa681d@skate>
Message-ID: <878vba1445.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello Peter,
 Thomas> (Resending with Buildroot list Cc'ed)

 Thomas> Could you quickly apply the following patches:

 Thomas>  * http://patchwork.ozlabs.org/patch/183305/

 Thomas>    This one fixes the linux-pam build failure reported at
 Thomas>    http://autobuild.buildroot.org/results/8a5a5c6f350666c8d3a0fd26878c0a21653e6a24/build-end.log
 Thomas>    and has been Acked by Arnout.

 Thomas>  * http://patchwork.ozlabs.org/patch/191292/

 Thomas>    It fixes the build failure at
 Thomas>    http://autobuild.buildroot.net/results/c279007dd8b89a1c6fc9b58d3c2cda01ab84279e/build-end.log

 Thomas>  * To fix the gpsd issue, apply either
 Thomas>    http://patchwork.ozlabs.org/patch/191291/ or
 Thomas>    http://patchwork.ozlabs.org/patch/191300/ or both.

 Thomas> I'm asking specifically to apply those ones quickly, because they are
 Thomas> really making the autobuild results horrible at the moment.

Done, thanks.

-- 
Bye, Peter Korsgaard
