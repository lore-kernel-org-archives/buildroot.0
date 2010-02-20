From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 16:49:35 +0100
Subject: [Buildroot] [PATCH 1/1] Add patch to fix uClibc build failure
 with locale enabled
In-Reply-To: <87pr442m2h.fsf@macbook.be.48ers.dk>
References: <cover.1266060467.git.thomas.petazzoni@free-electrons.com>
	<cover.1266060467.git.thomas.petazzoni@free-electrons.com>
	<2bf5840e578bf5ac8245f6ce27eb395acdbfd805.1266060467.git.thomas.petazzoni@free-electrons.com>
	<87pr442m2h.fsf@macbook.be.48ers.dk>
Message-ID: <20100220164935.796984cd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Feb 2010 11:28:22 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Thanks. Aything else in the stable branch we should take?

I don't know. Reading from the commit messages, some of the commits
seem to be relatively important fixes. What's our policy: integrate
fixes even if we haven't met the issue ourselves ? integrate all fixes
assuming that since they are part of the uClibc stable branch, they
should be ok ? I'd vote for the latter.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
