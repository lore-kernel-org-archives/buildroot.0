From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 May 2013 21:34:17 +0200
Subject: [Buildroot] [PATCH 1/1] kmod : protect against architectures
	without __NR_finit_module
In-Reply-To: <1369811238-31522-1-git-send-email-jeremy.rosen@openwide.fr>
 (=?utf-8?B?IkrDqXLDqW15?= Rosen"'s message of "Wed, 29 May 2013 09:07:18
 +0200")
References: <1369811238-31522-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <8738t560na.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?my" == J?r?my Rosen <jeremy.rosen@openwide.fr> writes:

 J?r?my> This bug caused udev to fail to load any module, crashing with Illegal
 J?r?my> instruction.

 J?r?my> The patch was taken from upstream and should be integrated in the next
 J?r?my> version of kmod (version 14)

Committed, thanks.

-- 
Bye, Peter Korsgaard
