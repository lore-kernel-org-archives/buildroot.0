From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 May 2014 22:23:33 +0200
Subject: [Buildroot] [PATCH] build log: add message when starting
	target-finalize target
In-Reply-To: <3230f72b2606158b2575.1399904367@argentina> (Thomas De
 Schampheleire's message of "Mon, 12 May 2014 16:19:27 +0200")
References: <3230f72b2606158b2575.1399904367@argentina>
Message-ID: <87zjim6916.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > The target-finalize target does a large number of actions (removing
 > unnecessary files, stripping objects, etc.) but does not have a header. This
 > makes it seem that all these actions are done as part of the last action
 > before target-finalize, for example:
 >>>> makedevs undefined Installing to target

 > To make a clear distinction, add a message to the beginning of
 > target-finalize:
 >>>> Finalizing target directory

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
