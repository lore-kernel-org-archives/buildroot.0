From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Aug 2016 11:08:14 +0200
Subject: [Buildroot] [PATCH] arch: add missing 'string' declaration to
	BR2_LD_TARGET_EMULATION
In-Reply-To: <1471505353-20289-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 18 Aug 2016 09:29:13 +0200")
References: <1471505353-20289-1-git-send-email-arnout@mind.be>
Message-ID: <87mvkaphq9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Commit dc6f4c8 forgot to give a type (string) to the newly introduced
 > BR2_LD_TARGET_EMULATION symbol.

Ehh, we don't have a dc6f4c8 commit. Are you referring to

http://patchwork.ozlabs.org/patch/606691/

If so, is this a sneaky way of sending your acked-by? ;)

-- 
Bye, Peter Korsgaard
