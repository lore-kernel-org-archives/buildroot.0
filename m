From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 08:37:09 +0200
Subject: [Buildroot] Fighting with suid bit
In-Reply-To: <01bcd0bb46db1d23d1ff9e66371da64c@chez.com> (kaneda@chez.com's
 message of "Sun, 06 May 2018 00:39:04 +0200")
References: <ffeaf5280e229a536de5f81fba84c99b@chez.com>
 <c41fae3e-3307-d3aa-8572-e65028237408@mind.be>
 <94873ecfb7c2d71d61d4ce5d76fd3cfb@chez.com>
 <87bmdvwmy9.fsf@dell.be.48ers.dk>
 <01bcd0bb46db1d23d1ff9e66371da64c@chez.com>
Message-ID: <87vac1thm2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "kaneda" == kaneda  <kaneda@chez.com> writes:

 > Shame on me !
 > You make me check my buildroot version and, unfortunatly, I was using
 > an old buildroot git commit.

Out of interest, what (git sha1) version was that?


 > I so switched to 2018.02.x branch.
 > Some hours later (distclean power), I can confirm suid bit is no
 > longer lost on cpio archive.

Ok, great!


 > Thanks for your help

You're welcome.

-- 
Bye, Peter Korsgaard
