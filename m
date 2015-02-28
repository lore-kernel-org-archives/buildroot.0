From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Feb 2015 20:34:51 +0100
Subject: [Buildroot] [PATCH v5 00/11] autobuild-run improvements
In-Reply-To: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150228203451.57206a8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 12 Dec 2014 21:04:45 +0100, Thomas De Schampheleire wrote:

> This series against the buildroot-test repo makes some improvements to the
> autobuild-run script.

I've finally taken some time to test this series, and I've reported two
separate problems as replies to e-mails: the make-opts split() issue,
and the merging of argument vs. configuration file values.

To avoid duplicate work, I've pushed the current state of your work
(with the fix to the merging order, and the multiprocessing.Process
fix) to:

   git://git.free-electrons.com/users/thomas-petazzoni/buildroot-test.git

in a branch called 'thomas-ds'.

Since both issues are more or less tied to the docopt migration, can
you have a look at them, and maybe simply propose followup patches that
I can merge back into the problematic commits, to fix those issues?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
