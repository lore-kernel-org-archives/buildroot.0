From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 17:36:45 +0100
Subject: [Buildroot] Some issues I have found in buildroot today.
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F1A85067046@EU1RDCRDC1WX029.exi.nxp.com>
	(Daniel James Laird's message of "Mon\,
	12 Jan 2009 17\:30\:36 +0100")
References: <20090112152242.565A7766E4@busybox.osuosl.org>
	<C13DBBE85AD6974B85C118C35890CA5F1A85066FB6@EU1RDCRDC1WX029.exi.nxp.com>
	<87eiz8h6tz.fsf@macbook.be.48ers.dk>
	<C13DBBE85AD6974B85C118C35890CA5F1A85067046@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <87ab9wh46a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel James Laird <daniel.j.laird@nxp.com> writes:

Hi,

 Daniel> My thoughts on the BR2_ENABLE_LOCALE were this:

 Daniel> Should the BR2_ENABLE_LOCALE options be moved from the
 Daniel> uclibc/Config.in file so that they are globally available.  I
 Daniel> could then set that I have a LOCALE enabled toolchain.  If I
 Daniel> set that I did not have a LOCALE enabled toolchain then it
 Daniel> would build libiconv like it does now.

Again, I don't know anything about the external toolchain stuff, but
it seems like you should have something to set the LOCALE/WCHAR
settings with external toolchains.

How is that handled now?

 Daniel> Or do I just add the same options to the
 Daniel> external-toolchain/Config.in?

That afaik won't work - Kconfig will complain.

-- 
Bye, Peter Korsgaard
