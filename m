From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Jan 2015 14:45:13 +0100
Subject: [Buildroot] [PATCH] linux: change Device Tree prompt
In-Reply-To: <1420201587-27417-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 2 Jan 2015 13:26:27 +0100")
References: <1420201587-27417-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87fvbt8ffa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The current prompt seems to imply that we want to add Device Tree
 > support to the Linux kernel:

 >     [*] Device tree support

 > But what it really means is that Buildroot will build a DTB.

 > Change the prompt so that it is obvious that this is the intended
 > behaviour, and users do not get mislead as to why Device Tree support is
 > not automatically added to their Linux kernel.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Changes v1 -> v2:
 >   - tweak help entry to state this can be multiple DTBs  (Thomas)

Committed, thanks.

-- 
Bye, Peter Korsgaard
