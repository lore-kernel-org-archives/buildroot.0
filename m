From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 May 2018 12:19:23 +0200
Subject: [Buildroot] [git commit] nasm: Fix compilation with GCC 8
In-Reply-To: <20180523102300.50015ac5@windsurf> (Thomas Petazzoni's message of
 "Wed, 23 May 2018 10:23:00 +0200")
References: <20180505092204.531518B51B@busybox.osuosl.org>
 <20180523102300.50015ac5@windsurf>
Message-ID: <878t8aznbo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > Peter, could you apply this one to 2018.02.x, to fix
 > http://autobuild.buildroot.net/results/98a/98a89f7203377d2c8b2f47bfdf00243a8837500e/build-end.log ?

Yes, I will run through the changes on master since -rc1 and backport
the applicable commits (including these host gcc8 fixes) tonight -
Thanks for the reminder.

-- 
Bye, Peter Korsgaard
