From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 May 2010 09:35:50 +0200
Subject: [Buildroot] [PATCH] Config.in: fix warning
In-Reply-To: <0D753D10438DA54287A00B0270842697636EFDBCA6@AUSP01VMBX24.collaborationhost.net>
	(H. Hartley Sweeten's message of "Thu, 13 May 2010 17:20:01 -0500")
References: <0D753D10438DA54287A00B0270842697636EFDBCA6@AUSP01VMBX24.collaborationhost.net>
Message-ID: <87mxvz0yll.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> The latest change to BR2_VERSION left the trailing " off the
 H> default value.  This produces the following warning:

 H> $ make menuconfig
 H> Config.in:11:warning: multi-line strings not supported

Argh, thanks - Committed.

-- 
Bye, Peter Korsgaard
