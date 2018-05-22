From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 May 2018 09:46:57 +0200
Subject: [Buildroot] [PATCH] package/gcc: add support for gcc 8.1
In-Reply-To: <trinity-f4d4faec-6692-4477-bdc0-4fdafca1e308-1526973512041@3c-app-mailcom-bs08>
 (daggs@gmx.com's message of "Tue, 22 May 2018 09:18:32 +0200")
References: <20180505105844.5278-1-romain.naour@gmail.com>
 <20180520124507.23c2a29b@windsurf>
 <71945c16-5343-400c-01fe-44f1d5cb31c2@gmail.com>
 <87bmd8ismc.fsf@dell.be.48ers.dk>
 <trinity-f4d4faec-6692-4477-bdc0-4fdafca1e308-1526973512041@3c-app-mailcom-bs08>
Message-ID: <8736yki13i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "daggs" == daggs  <daggs@gmx.com> writes:

Hi,

 > afaik, the mainline support for this board lacks proper vpu support.

Correct, but that shouldn't be a blocker for a Buildroot defconfig?

 > in addition, due to the patchwork issue, my last bunch of patches of
 > mainline support were lost and got ignored so I've decided to stop
 > pursuing this matter.

:/

 > as said in another mail here, I'm unable to boot the board as I've
 > misplaced the ac adapter, I can try looking for it again but it won't
 > be until the weekend.
 > you said a while ago you have access to such board, if you have time
 > to bump the vendor kernel and uboot revs to latest and test if it
 > works, maybe this issue can be resolved without dropping support for
 > this board.

I don't have an odroidc2, but I know some colleagues of mine do. If
needed, I can try to temporarily borrow one.

-- 
Bye, Peter Korsgaard
