From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jan 2009 14:02:53 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <200901071319.00644.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Wed\, 7 Jan 2009 13\:19\:00 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
	<87y6xnldvt.fsf@macbook.be.48ers.dk>
	<200901071319.00644.markus.heidelberg@web.de>
Message-ID: <878wpnl14y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

Hi,

 >> (resend with trimmed Cc line to please mailman)

 Markus> What was the problem with the former mail?  In my sent mail
 Markus> you, Ulf and HCE were on Cc, but when receiving my mail from
 Markus> the list, only Ulf was on Cc, you and HCE were gone. Is this
 Markus> a related problem? How to fix it?

Mailman bounced the mail to the list because it didn't like the long
Cc list.

We might ask the osuosl.org people to tweak the config, but I'm still
waiting on them to fix the buildroot at busybox.net bounces.

 Markus> I don't remember where to find the git URL, but I did it somehow once:
 Markus> git://www.atmel.no/~hcegtvedt/buildroot/avr32.git

Thanks.

 >> Exactly. Who will redo this patch if I bump the mplayer version?

 Markus> I tried it some weeks ago. I think it should have worked, but I got
 Markus> a compile error that wasn't related to the patch as far as I remember
 Markus> and judge. I had some time consuming toolchain rebuilds and then I
 Markus> noticed that the new version wasn't really necessary, so I stopped
 Markus> investigating further and stayed with the current version.

Ok.

 Markus> And even if it worked, this is not a solution. Someone should make it
 Markus> ready and submit it upstream and it's definetly not me, I haven't
 Markus> written the patch and cannot say anything about it's maturity.

Probably HcE in the long run, but he seems quite busy at the moment.

 Markus> If nobody involved in this patch has the time to do it, it
 Markus> should best be thrown out of uclibc-buildroot and just be
 Markus> kept in HCE's repo.

Agreed.

-- 
Bye, Peter Korsgaard
