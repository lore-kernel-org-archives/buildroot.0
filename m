From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Jan 2017 13:00:25 +0100
Subject: [Buildroot] using custom compiler for a specific pkg
In-Reply-To: <trinity-e5bd221b-be64-4b4d-af05-5b49f36635fa-1483821716512@3capp-mailcom-bs06>
 (daggs@gmx.com's message of "Sat, 7 Jan 2017 21:41:56 +0100")
References: <trinity-e5bd221b-be64-4b4d-af05-5b49f36635fa-1483821716512@3capp-mailcom-bs06>
Message-ID: <87vatoo33a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "daggs" == daggs  <daggs@gmx.com> writes:

 > Greetings,
 > I want to test a theory I have and I need to compile a specific pkg with a compiler that differs from the buildroot's main compiler.
 > how can I do that?

That sounds odd. Depending on the build system of that package you can
probably tell it to use a different compiler by pointing CC= to it?

-- 
Bye, Peter Korsgaard
