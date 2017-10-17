From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:07:56 +0200
Subject: [Buildroot] [PATCH 1/1] ifupdown-scripts: Stop installing
	.empty files.
In-Reply-To: <20171015005719.16792-1-camh@xdna.net> (Cam Hutchison's message
 of "Sun, 15 Oct 2017 11:57:19 +1100")
References: <20171015005719.16792-1-camh@xdna.net>
Message-ID: <87bml6i1lf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cam" == Cam Hutchison <camh@xdna.net> writes:

 > ifupdown-scripts has some .empty files to maintain empty directories in
 > git. Previously this package used to be part of the skeleton which used
 > SYSTEM_RSYNC to copy the directories to the target. When it was split
 > into a separate package, cp -a was used to do the copy instead, which
 > copies the .empty files.

 > Change to SYSTEM_RSYNC which excludes .empty files.

 > Signed-off-by: Cam Hutchison <camh@xdna.net>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
