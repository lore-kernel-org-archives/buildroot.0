From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Nov 2010 15:00:11 +0100
Subject: [Buildroot] [PATCH 11/12] directfb: bump to 1.4.10
In-Reply-To: <AANLkTikTS__-Px2HgH9AKX_ybQC1oK=hA+N5KOft9zxz@mail.gmail.com>
	(Lionel Landwerlin's message of "Fri, 5 Nov 2010 14:30:23 +0100")
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
	<1288839031-24277-12-git-send-email-llandwerlin@gmail.com>
	<87hbfw3pb2.fsf@macbook.be.48ers.dk>
	<AANLkTikTS__-Px2HgH9AKX_ybQC1oK=hA+N5KOft9zxz@mail.gmail.com>
Message-ID: <87iq0b3m6s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

Hi,

 >> We seem to be dropping -lm.
 >> 
 >> Any idea why? If not, then I'll revert the patch as I would like to put
 >> out -rc1 this weekend.
 >> 

 Lionel> I issue has been discussed on the directfb mailing list indeed.
 Lionel> I haven't seen it with glibc...

 Lionel> If you're about reverting it, you also have to revert the sawman bump.
 Lionel> I think I can add a patch to force -lm for now, I will send this patch
 Lionel> tonight. Can you wait for it ?

Sure, I'm planning on cutting -rc1 Sunday.

-- 
Bye, Peter Korsgaard
