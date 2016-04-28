From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 19:42:46 +0200
Subject: [Buildroot] [V4 1/3] libtommath: new package
In-Reply-To: <CAB0FRstC6V9123cEaw-B88hX=a5NxmtLq7doRSFKdBze1bcYCA@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Thu, 28 Apr 2016
 18:39:50 +0200")
References: <1460300126-11046-1-git-send-email-francois.perrad@gadz.org>
 <87h9em23v6.fsf@dell.be.48ers.dk>
 <CAB0FRstC6V9123cEaw-B88hX=a5NxmtLq7doRSFKdBze1bcYCA@mail.gmail.com>
Message-ID: <87k2jhy6i1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 > Peter,
 > I am also in doubt with Dropbear.
 > 1) Dropbear is a critical component for many system.
 > 2) Dropbear is often released (5 releases in 2015, 2015.67 to
 > 2015.71), but the bundled libraries (libtommath & libtomcrypt) seem
 > never updated (most of files are 9 years old, see
 > github.com/mkj/dropbear).
 > 3) in V1 & V2 of this serie, by default, Dropbear was built with the
 > bundled libraries, but the BR policy is "always use unbundled library"
 > (see review from Thomas P.)

 > I need libtommath & libtomcrypt as dependencies for other packages, so
 > could you at least commit the 2 first patches ?

Sure, I'll do so now.

 > Fran?ois.

 > Note: I did some upstream works (C linting, ...) on these 3 packages,
 > with some Pull Requests (pending or already merged).

Yes, I saw - Thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
