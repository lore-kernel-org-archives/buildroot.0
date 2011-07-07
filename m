From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 13:46:32 +0200
Subject: [Buildroot] Note on the large files support in sqlite(as part
	of Qt)
In-Reply-To: <4E159ACF.7030508@gmail.com> (Sergey Gusarov's message of "Thu,
 07 Jul 2011 15:38:55 +0400")
References: <4E14BBEC.40908@gmail.com> <87iprft86n.fsf@macbook.be.48ers.dk>
 <4E159ACF.7030508@gmail.com>
Message-ID: <8762nes487.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergey" == Sergey Gusarov <laborer2008@gmail.com> writes:

Hi,

 Sergey> Oh, i was wrong. My Qt 4.7.3 sources were already patched. The patch
 Sergey> is not yet included. Nevertheless, it seems correct errors in upsteam
 Sergey> project more accurately.

Sorry, I cannot parse the last sentence. What do you mean exactly? That
I should have submitted a bug report to Qt?

 >> Did you try it?

 Sergey> Yes. I compiled qt with uclibc-based toolchain without LFS. You also
 Sergey> can try to do this.

Well, I did - That's why I added the commit in the first place. Are you
saying that the commit somehow isn't needed?

From a quick look at the patch in the qt bugtracker, it seem like only
the sqlite extension is fixed, not webkit.

-- 
Bye, Peter Korsgaard
