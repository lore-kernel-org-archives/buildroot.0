From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Dec 2011 00:23:14 +0100
Subject: [Buildroot] [PATCH v3] Add package connman
In-Reply-To: <4EDD51B8.5050705@gmail.com> (Daniel Mack's message of "Tue, 06
 Dec 2011 00:20:24 +0100")
References: <4EDCFEB2.60603@gmail.com>
 <1323106241-22192-1-git-send-email-zonque@gmail.com>
 <87fwgyslv8.fsf@macbook.be.48ers.dk> <4EDD4EAE.7010808@gmail.com>
 <87bormsjcz.fsf@macbook.be.48ers.dk> <4EDD51B8.5050705@gmail.com>
Message-ID: <877h2asivx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

Hi,

 >> In concept, yes - But as the RESOLVER_SUPPORT isn't in any release yet,
 >> it becomes a bit more tricky. We can backport the changes to 0.9.32, but
 >> existing binary toolchains and ctng (unless Yann agrees and we also
 >> backport to there) stuff will fail.

 Daniel> In a previous discussion on this list I was asking about just
 Daniel> this, and back then you agreed we could depend on
 Daniel> BR2_UCLIBC_VERSION_SNAPSHOT in such a case until there's a new
 Daniel> release.

Sorry, I don't recall that discussion, but it makes sense.

 >> I'll take a look at it.

 Daniel> Ok, great. I'll post a new version with the discussed topics
 Daniel> and leave the decision of how to handle the toolchain deps to
 Daniel> you. Is that ok for you?

Yes, that's fine.

-- 
Bye, Peter Korsgaard
