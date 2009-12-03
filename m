From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Dec 2009 14:13:22 +0100
Subject: [Buildroot] Help understanding how to develop with buildroot
In-Reply-To: <16d4c3590912030440j4655c776w9dc54c3f0fe46cab@mail.gmail.com>
	(Mike Crowe's message of "Thu, 3 Dec 2009 07:40:22 -0500")
References: <16d4c3590912021826v916b813gf6f422634058df54@mail.gmail.com>
	<878wdktkm6.fsf@macbook.be.48ers.dk>
	<16d4c3590912030440j4655c776w9dc54c3f0fe46cab@mail.gmail.com>
Message-ID: <87r5rcryj1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Crowe <drmikecrowe@gmail.com> writes:

Hi,

 Mike> I'm starting to port our application to an embedded device. ?I
 Mike> think there will be quite a few changes, and it's a fairly large
 Mike> application. ?I believe there may be week(s) changing the
 Mike> application to get it to run in the new environment. ?That's why
 Mike> I wanted to avoid a complete recompile each build.

OK, you can trigger a rebuild of just your package by removing the
correct file (depends on how you integrated it in BR what that file is)
or simply delete the build_arm/<package> directory.

For initial development with lots of compile/test/fix cycles it probably
makes more sense to build your application by hand instead of in BR
though.

-- 
Bye, Peter Korsgaard
