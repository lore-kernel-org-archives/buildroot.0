From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Feb 2010 22:08:11 +0100
Subject: [Buildroot] [PATCH 1/1] Add patch to fix uClibc build failure
	with locale enabled
In-Reply-To: <20100220164935.796984cd@surf> (Thomas Petazzoni's message of
	"Sat, 20 Feb 2010 16:49:35 +0100")
References: <cover.1266060467.git.thomas.petazzoni@free-electrons.com>
	<cover.1266060467.git.thomas.petazzoni@free-electrons.com>
	<2bf5840e578bf5ac8245f6ce27eb395acdbfd805.1266060467.git.thomas.petazzoni@free-electrons.com>
	<87pr442m2h.fsf@macbook.be.48ers.dk> <20100220164935.796984cd@surf>
Message-ID: <874ol9htc4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Wed, 17 Feb 2010 11:28:22 +0100
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 >> Thanks. Aything else in the stable branch we should take?

 Thomas> I don't know. Reading from the commit messages, some of the
 Thomas> commits seem to be relatively important fixes. What's our
 Thomas> policy: integrate fixes even if we haven't met the issue
 Thomas> ourselves ? integrate all fixes assuming that since they are
 Thomas> part of the uClibc stable branch, they should be ok ? I'd vote
 Thomas> for the latter.

Ok, I've committed everything on the 0_9_30 branch since the 0.9.30.2
release.

-- 
Bye, Peter Korsgaard
