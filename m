From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Mar 2012 00:07:06 +0100
Subject: [Buildroot] missing reference to libm for MicroPerl
In-Reply-To: <CADxd2g8k8X=xNBWdE=dSbCUnkupecS1LdDZwiVYKiYTry1Uo4A@mail.gmail.com>
 (Joshua Jackson's message of "Tue, 6 Mar 2012 11:46:06 -0500")
References: <CADxd2g8k8X=xNBWdE=dSbCUnkupecS1LdDZwiVYKiYTry1Uo4A@mail.gmail.com>
Message-ID: <87vcmgdn8l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joshua" == Joshua Jackson <jjackson@vortech.net> writes:

 Joshua> I am currently running into an issue with the compilation of MicroPerl
 Joshua> fails with a missing libm reference. I found the following patch that
 Joshua> was date from a couple years ago:

 Joshua> This fixes builds on my system, but I'm not sure what else it
 Joshua> might break.

 Joshua> Is there another fix / setting I might be missing to prevent
 Joshua> the need for this patch?

Thanks. I committed a similar patch to git from Arnout earlier this
week.

-- 
Bye, Peter Korsgaard
