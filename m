From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jul 2014 22:22:37 +0200
Subject: [Buildroot] [PATCH v2] infra: fix autotools .la fixing when no
	.la files are present
In-Reply-To: <bb03ffeaa528d3c99f51.1404659451@localhost> (Thomas De
 Schampheleire's message of "Sun, 06 Jul 2014 17:10:51 +0200")
References: <bb03ffeaa528d3c99f51.1404659451@localhost>
Message-ID: <87k37q2q5u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Commit 6f638ea9c9c7bacc646430a74ad3dd2740eae676 ("infra: /usr support:
 > STAGING_DIR can be outside BASE_DIR") changed a for-construct around 'sed
 > -i' in a 'find | xargs sed -i'. However, if the find returns no results,
 > sed complains with:
 >     '/bin/sed: no input files'

 > This commit adds the extra parameter -r / --no-run-if-empty to the xargs
 > call, effectively fixing this problem case.

 > Reported-by: Rohit Kumar <rkthebest@gmail.com>
 > Fix-suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
