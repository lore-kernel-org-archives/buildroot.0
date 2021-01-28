From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 17:44:59 +0100
Subject: [Buildroot] [git commit] utils: fix flake8 warning
In-Reply-To: <20210123200520.1174581807@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 23 Jan 2021 21:24:48 +0100")
References: <20210123200520.1174581807@busybox.osuosl.org>
Message-ID: <87r1m53t9w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=9277978e28479449e517152105ae2e8a6d03151a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 40bb37bd70d refactored get-developers, and now the 'os' module is
 > no longer needed, but still imported:

 >     utils/get-developers:6:1: F401 'os' imported but unused
 >     1     F401 'os' imported but unused

 > Drop it now.

 > Reported-by: Arnout Vandecappelle <arnout@mind.be>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
