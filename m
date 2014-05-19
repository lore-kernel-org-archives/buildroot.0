From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 May 2014 22:36:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkit: Fix OpenGL-related
	dependencies
In-Reply-To: <0b5q4bx1us.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Mon, 19 May 2014 22:14:56 +0200")
References: <1400525369-32257-1-git-send-email-bernd.kuhls@t-online.de>
 <0b5q4bx1us.ln2@ID-313208.user.individual.net>
Message-ID: <87d2f9jyko.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > Bernd Kuhls <bernd.kuhls@t-online.de> wrote in
 > news:1400525369-32257-1-git-send-email-bernd.kuhls at t-online.de: 

 >> fixes
 >> http://autobuild.buildroot.net/results/27a/27a674c6a19a729fae5cc33de0360b
 >> 2a061930c1/ 

 > Hi,

 > please do not commit the patch as is, it needs more polishing ;)
 > (webkit takes ages to compile...)

Yes, I'm doing some tests as well. I'll reply to your patch and explain
what I'm changing.

-- 
Bye, Peter Korsgaard
