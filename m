From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 15:39:40 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/u-boot/2009.01-rc1
In-Reply-To: <20090103000456.97D1E769FA@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 3 Jan 2009 00\:04\:56 +0000 \(UTC\)")
References: <20090103000456.97D1E769FA@busybox.osuosl.org>
Message-ID: <87iqosqz0z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-03 00:04:55 +0000 (Sat, 03 Jan 2009)
 ulf> New Revision: 24656

 ulf> Log:
 ulf> Provide factory default command to u-boot, using Buildroot variables

 ulf> Added:
 ulf>    trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-009-factory.patch

Do we really need this? What's the upstream status of it?

I would very much like to limit the number of patches to the minimum
(E.G. bugfixes, needed hardware support), and this doesn't look like
either to those.

-- 
Bye, Peter Korsgaard
