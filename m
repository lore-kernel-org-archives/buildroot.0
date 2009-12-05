From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 05 Dec 2009 14:14:09 +0100
Subject: [Buildroot] [git commit master] toolchain: get rid of unused
	gcc 3.x legacy handling
In-Reply-To: <200912050639.59769.minimod@morethan.org> (Michael S. Zick's
	message of "Sat, 5 Dec 2009 06:39:56 -0600")
References: <20091204195654.7B902777CF@busybox.osuosl.org>
	<200912050639.59769.minimod@morethan.org>
Message-ID: <87skbpr2am.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

 Michael> On Fri December 4 2009, Peter Korsgaard wrote:

 Michael> I suggest that you mark this one as "Legacy" rather than take it out.

Too late. This was *UNUSED*, E.G. we don't have any support for gcc 3.x
in Kconfig in git (and haven't had for some time.

When cannot continue growing versions / config options forever without
growing the developer base, so we normally remove old versions when we add
new ones (E.G. see the recent binutils changes).

-- 
Bye, Peter Korsgaard
