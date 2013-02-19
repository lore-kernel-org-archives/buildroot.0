From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Feb 2013 13:41:55 +0100
Subject: [Buildroot] [PATCH 3/4] fs/ext2: rename to 'ext' as it can now
	build ext2/3/4 filesystems
In-Reply-To: <512327AD.3040703@mind.be> (Arnout Vandecappelle's message of
 "Tue, 19 Feb 2013 08:20:13 +0100")
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <bcd3b138016eb551aa3b5e3dfe461e718e83bcb3.1361142401.git.yann.morin.1998@free.fr>
 <512327AD.3040703@mind.be>
Message-ID: <87ppzwh3vw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 18/02/13 00:10, Yann E. MORIN wrote:
 >> Update defconfigs and boards readmes accordingly.

 Arnout>  I don't really like this. I think it falls in the category "yes it
 Arnout> would make things more consistent, but it's major API breakage that
 Arnout> may make upgrading unnecessarily difficult". Peter decided to be more
 Arnout> careful with that kind of changes, and rightly so.

Agreed.

 Arnout>  This rename is useful, though, and it shouldn't hurt anyone. If
 Arnout> anyone is using it, it will be pretty clear what happened, and it wil
 Arnout> draw their attention to the new features of genextfs.sh.

Agreed.

-- 
Bye, Peter Korsgaard
