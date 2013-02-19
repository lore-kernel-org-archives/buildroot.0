From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Feb 2013 21:48:06 +0100
Subject: [Buildroot] [PATCH 3/4] fs/ext2: rename to 'ext' as it can now
	build ext2/3/4 filesystems
In-Reply-To: <201302191914.43962.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Tue, 19 Feb 2013 19:14:43 +0100")
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <512327AD.3040703@mind.be> <87ppzwh3vw.fsf@dell.be.48ers.dk>
 <201302191914.43962.yann.morin.1998@free.fr>
Message-ID: <87obfgjaih.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Peter, Arnout, All,
 Yann> On Tuesday 19 February 2013 Peter Korsgaard wrote:
 >> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
 >> 
 Arnout> On 18/02/13 00:10, Yann E. MORIN wrote:
 >> >> Update defconfigs and boards readmes accordingly.
 >> 
 Arnout> I don't really like this. I think it falls in the category "yes it
 Arnout> would make things more consistent, but it's major API breakage that
 Arnout> may make upgrading unnecessarily difficult". Peter decided to be more
 Arnout> careful with that kind of changes, and rightly so.
 >> 
 >> Agreed.
 >> 
 Arnout> This rename is useful, though, and it shouldn't hurt anyone. If
 Arnout> anyone is using it, it will be pretty clear what happened, and it wil
 Arnout> draw their attention to the new features of genextfs.sh.
 >> 
 >> Agreed.

 Yann> OK, I'm puzzled. 8-/

 Yann> Peter, you agreed on both points, which are the opposites one of
 Yann> the other.  What should I conclude about this: do the change, or
 Yann> not do the change?

Huh, Arnout's first comment was about the defconfigs /
BR2_TARGET_ROOTFS_EXT{2,} change, which we both dislike - And the 2nd
was about the fs/ renames which should be transparent to the user.

Unless I'm confused, atleast.

-- 
Bye, Peter Korsgaard
