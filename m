From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 20:31:50 +0200
Subject: [Buildroot] [PATCH] shairport-sync: add upstream patch to fix
 soxr configure issue
In-Reply-To: <20180909094317.10873-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sun, 9 Sep 2018 11:43:17 +0200")
References: <20180909094317.10873-1-joerg.krause@embedded.rocks>
Message-ID: <871s994iy1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Commit b06639cf7a adds an upstream patch to fix a build issue with soxr.
 > The patch also adds detecting soxr using pkg-config. Upstream detected
 > an config issue [1], where the resulting binary lacks soxr support, although
 > libsoxr was correctly detected.

 > This patch adds a define for `HAVE_LIBSOXR` when using pkg-config.

 > Backported from: cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9

 > [1] https://github.com/mikebrady/shairport-sync/issues/740

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 > ---
 > Should be committed to 2018.02.x and 2018.05.x, too.

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
