From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Dec 2012 22:30:51 +0100
Subject: [Buildroot] builroot-2012.11.tar.bz2: CVS control directory
	left in toolchain/elf2flt/elf2flt
In-Reply-To: <50CA3F70.2060900@wanadoo.fr> (Thierry Bultel's message of "Thu, 
 13 Dec 2012 21:49:52 +0100")
References: <50CA3F70.2060900@wanadoo.fr>
Message-ID: <87lid1ljw4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thierry" == Thierry Bultel <thierry.bultel@wanadoo.fr> writes:

 Thierry> FYI
 Thierry> Thierry

Yes, that's on purpose. Elf2flt doesn't have releases, so the easiest
way of working with it is from an existing CVS checkout, atleast that
was how it was back when it was added in 2006.

Now, it hasn't really been updated in buildroot since then, so I doubt
people are really using it - Perhaps we should deprecate it?

-- 
Bye, Peter Korsgaard
