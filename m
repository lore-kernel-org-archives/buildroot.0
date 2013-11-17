From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Nov 2013 08:38:24 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: Rename the first patch to match
	the naming policy.
In-Reply-To: <5286C42F.3060802@mind.be> (Arnout Vandecappelle's message of
 "Sat, 16 Nov 2013 02:02:39 +0100")
References: <1384507838-4675-1-git-send-email-Sonic.adi@gmail.com>
 <CAAXf6LW2zFZ2OCh4G7SrPAc52hpAb0KC=HuOj=gFaA2fsTu_cg@mail.gmail.com>
 <20131115104511.56ab9a97@skate> <5286C42F.3060802@mind.be>
Message-ID: <87eh6fzde7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >>> Also here I wonder why git/git-format-patch did not recognize the move?
 >> 
 >> Because you need to explicitly do a 'git format-patch -M', or configure
 >> Git in your ~/.gitconfig to enable rename detection permanently.

 >  But anyway it doesn't really matter, since git-repack will convert it
 > into a proper rename. It just makes the patch on the list shorter and
 > easier to review.

.. which is also very important!

-- 
Bye, Peter Korsgaard
