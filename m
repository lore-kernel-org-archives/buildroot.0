From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 2 May 2014 10:33:41 +0200
Subject: [Buildroot] 2014.05 release cycle: open patches to consider
In-Reply-To: <CAAXf6LWk1C0uUjY3-5=a0347TnQyBRym9SpQUZN=xj0aNfNRNg@mail.gmail.com>
References: <CAAXf6LWk1C0uUjY3-5=a0347TnQyBRym9SpQUZN=xj0aNfNRNg@mail.gmail.com>
Message-ID: <CAAXf6LXWw5ybnPVNgjaadipuhG9PTv8LLsCzpnSC9h6QMNq9iA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Grr, buildroot list in copy]

Hi,

During the last Buildroot Developer Days in February, we concluded on
the goal of having no patches older than 6 months in patchwork, at the
time of the release.

Excluding the patches triaged during the patchwork cleanup sessions,
we have reached that goal for the 2014.05 release (hooza!). The oldest
patches are from November 2013.

Since we are starting the stabilization month for 2014.05, I won't try
to push real feature patches anymore, but there are a number of
improvement/bugfix patches in patchwork that I believe could still be
applied.

Some of these patches have not received any review/ack/test, or may
need to be rebased. So this is an action point to the community:
review, test and/or rebase these patches to help get these patches
integrated!

Here is the list of patches that I think should be considered for
2014.05 still: (starting from the oldest first, not including the very
latest patches)

http://patchwork.ozlabs.org/patch/305422/
package: unification of use $(subst [._-], [._-], $(<PKG>_VERSION)) macro
Jerzy Grzegorek

http://patchwork.ozlabs.org/patch/323339/
[v2,1/2] infra: Add generic check_prog_host function
http://patchwork.ozlabs.org/patch/323340/
[v2,2/2] classpath: Use generic check for host program
Maxime Hadjinlian

http://patchwork.ozlabs.org/patch/326513/
[1/2] toolchain: generate a gdbinit file
Thomas Petazzoni

http://patchwork.ozlabs.org/patch/332885/
Makefile: move fs/common.mk above external.mk
Philippe Reynes <tremyfr@yahoo.fr>

http://patchwork.ozlabs.org/patch/334855/
[v3] infra: Add PRE_*_HOOKS for every step
Maxime Hadjinlian

http://patchwork.ozlabs.org/patch/337161/
perf: Fix compilation without libelf for post-3.10 kernels
Peter Meerwald pmeerw at pmeerw.net

http://patchwork.ozlabs.org/patch/341675/
[1/1] cups: move localstatedir from /usr/var to /var
Danomi Manchego

http://patchwork.ozlabs.org/patch/344390/
[v3,1/2] ccache: change default cache directory path to match config setting
http://patchwork.ozlabs.org/patch/344391/
[v3,2/2] ccache: provide capability to do initial ccache setup
Danomi Manchego


Best regards,
Thomas
