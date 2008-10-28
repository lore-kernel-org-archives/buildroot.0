From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Oct 2008 08:32:41 +0100
Subject: [Buildroot] Synchronisation of dependencies between Config.in
	and .mk files ?
In-Reply-To: <e4c675870810271533q21914df7od498b0be858600e2@mail.gmail.com>
	(Roberto A. Foglietta's message of "Mon\,
	27 Oct 2008 23\:33\:35 +0100")
References: <20081027175645.7e7cb096@surf>
	<87zlkphoas.fsf@macbook.be.48ers.dk> <20081027211141.0935d9c0@surf>
	<200810272247.34068.markus.heidelberg@web.de>
	<e4c675870810271533q21914df7od498b0be858600e2@mail.gmail.com>
Message-ID: <87ljw9dvja.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roberto" == Roberto A Foglietta <roberto.foglietta@gmail.com> writes:

Hi,

 Roberto>  I think the use of "depends on" in Config.in should be used
 Roberto> ONLY when arch restrictions have been involved.

We normally only use depends on for sub packages (E.G. X applications
that don't make any sense without X) and for toolchain dependencies
(E.G. locale support) as changing toolchain option with select isn't a
good thing.


-- 
Bye, Peter Korsgaard
