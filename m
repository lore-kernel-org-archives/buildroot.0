From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Sep 2016 10:08:48 +0200
Subject: [Buildroot] Stripping kernel modules for ARC
In-Reply-To: <20160915094938.05417946@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 15 Sep 2016 09:49:38 +0200")
References: <1473852437.3766.15.camel@synopsys.com>
 <CAE2F3rCBwysRFrMf4CD6uLevvfw0TNaZGyptOj6MLDQvGPPwFg@mail.gmail.com>
 <20160915084753.4717445f@free-electrons.com>
 <87a8f9fx5p.fsf@dell.be.48ers.dk>
 <20160915094938.05417946@free-electrons.com>
Message-ID: <8760pxfuun.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 15 Sep 2016 09:18:58 +0200, Peter Korsgaard wrote:

 >> Sounds good. When was this introduced and what about external kernel modules?

 > Introduced in commit ac031f26e89cc04fc7504f31ae137857eb83a051, appeared
 > first in 2.6.18.

Ok, good!

 > External kernel modules: the one using kbuild will do fine, as long as
 > we use the modules_install target of the kbuild build system and not
 > manually install/copy the .ko files.

 > External kernel modules not using kbuild would obviously no longer be
 > stripped. Not sure how many of these we have today, and how to handle
 > them. They could be problematic :-/

I guess we'll just have to handle those explictly whenever we find them.

-- 
Venlig hilsen,
Peter Korsgaard 
