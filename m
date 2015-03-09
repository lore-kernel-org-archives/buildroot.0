From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Mar 2015 22:06:00 +0100
Subject: [Buildroot] [PATCH] fs/common: build host-xz when xz
	compression is used
In-Reply-To: <02D91C4C-A869-470B-A9CC-6C56DDEA03A4@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 09 Mar 2015 20:44:01 +0100")
References: <1425893653-9577-1-git-send-email-patrickdepinguin@gmail.com>
 <87r3syqpjn.fsf@dell.be.48ers.dk>
 <02D91C4C-A869-470B-A9CC-6C56DDEA03A4@gmail.com>
Message-ID: <87mw3lridj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > On March 9, 2015 2:16:28 PM CET, Peter Korsgaard <peter@korsgaard.com> wrote:

>> Isn't that already handled by support/dependencies/check-host-xzcat.mk?

 > No, that file handles xzcat, the decompression tool, but in fs/ we use
 >  compression (xz).

While that is true, have you ever seen a distribution that provides one
but not the other? They come from the same upstream package.

And if there would be such an (odd) distribution somewhere we could
probably extend check-host-xzcat.mk to check for both with little effort.

-- 
Venlig hilsen,
Peter Korsgaard 
