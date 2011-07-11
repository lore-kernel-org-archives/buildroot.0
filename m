From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 07:10:37 +0200
Subject: [Buildroot] [PATCH] ebtables: new package
In-Reply-To: <20110711035716.GA20349@sapphire.tkos.co.il> (Baruch Siach's
 message of "Mon, 11 Jul 2011 06:57:16 +0300")
References: <f2408a31cec10972f6f2a4a5fc885b4cc6704eb8.1310046029.git.baruch@tkos.co.il>
 <87y605x2r0.fsf@macbook.be.48ers.dk>
 <20110711035716.GA20349@sapphire.tkos.co.il>
Message-ID: <87pqlhwgfm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> Doesn't the makefile have an install target?

 Baruch> It does, but the 'exec' target (a dependency of 'install') uses
 Baruch> install with -o root, which fails when building as non-root. Is
 Baruch> there a standard way to make the install target under fakeroot?

Ok, in that case you can either do:
- Manual install like you're doing now
- Patch the Makefile to fix it

The manual install option is OK with me.

 >> Care to fix and resend?

 Baruch> I'll update and resend.

Great, thanks.

-- 
Bye, Peter Korsgaard
