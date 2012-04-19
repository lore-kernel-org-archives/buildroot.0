From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Apr 2012 15:48:46 +0200
Subject: [Buildroot] [PATCH 1/3] Fix systemd failure with lock files
In-Reply-To: <acb90f809d4410dd78028afde9e9884bc780f14a.1334748542.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 18 Apr 2012 13:29:21 +0200")
References: <cover.1334748542.git.maxime.ripard@free-electrons.com>
 <cover.1334748542.git.maxime.ripard@free-electrons.com>
 <acb90f809d4410dd78028afde9e9884bc780f14a.1334748542.git.maxime.ripard@free-electrons.com>
Message-ID: <87r4vjn875.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Systemd introduced a new policy described here:
 Maxime> http://lists.freedesktop.org/archives/systemd-devel/2011-March/001823.html

 Maxime> Add the "lock" group to buildroot to allow systemd to set this
 Maxime> in place at boot time

Committed, thanks.

-- 
Bye, Peter Korsgaard
