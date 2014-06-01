From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 17:35:10 +0200
Subject: [Buildroot] [PATCH] manual: fix spelling mistakes
In-Reply-To: <e7f92132-1c41-46b9-818b-f6e14eedc722@email.android.com> (Thomas
 De Schampheleire's message of "Sat, 31 May 2014 11:29:50 +0200")
References: <1401524780-5128-1-git-send-email-spdawson@gmail.com>
 <e7f92132-1c41-46b9-818b-f6e14eedc722@email.android.com>
Message-ID: <87iook63td.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> The main macro of the LuaRocks package infrastructure is +luarocks-package+:
 >> like +generic-package+ it works by defining a number of variables providing
 >> -meta informations about the package, and then calling +luarocks-package+. It
 >> +meta information about the package, and then calling +luarocks-package+. It
 >> is worth mentioning that building LuaRocks packages for the host is not
 >> supported, so the macro +host-luarocks-package+ is not implemented.

 > Previously in this patch, meta information was written with
 > hyphen. Which is the correct spelling?

I don't know. Simon?

This inconsistency is not really related to this patch, so I have
applied it.

-- 
Bye, Peter Korsgaard
