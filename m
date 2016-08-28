From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Aug 2016 22:37:21 +0200
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source
	of kernel code"
In-Reply-To: <20160827222353.02bc0df2@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 27 Aug 2016 22:23:53 +0200")
References: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
 <20160827222353.02bc0df2@free-electrons.com>
Message-ID: <87twe4aav2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Peter, Yann,
 > Peter: do you have an opinion on this patch. If not, I think I'm going
 > to apply it, so please raise your opinion if you disagree.

There probably are users of the option somewhere, so removing it will be
a bit annoying for them - But changing to override srcdir should be
fairly simple so I'm fine with it (for next).

-- 
Bye, Peter Korsgaard
