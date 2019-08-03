From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 20:00:26 +0200
Subject: [Buildroot] [PATCH 01/13 v2] supports/scripts: declare missing
 local variables
In-Reply-To: <13072f388441fc50176afb83d877b33fe5cad833.1564431589.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 29 Jul 2019 22:19:51 +0200")
References: <cover.1564431589.git.yann.morin.1998@free.fr>
 <13072f388441fc50176afb83d877b33fe5cad833.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <87imre9lj9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit b14b02698 (core/br2-external: restore compatibility with old
 > distros) switched to using 'eval' to emulate assocviative arrays, for
 > those distros too old to have bash-4+.

 > In so doing, it forgot to declare the new local variables in the
 > respective helper functions.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Vadim Kochan <vadim4j@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

 > ---
 > Changes v1 -> v2;
 >   - add another missing variable

Committed, thanks.

-- 
Bye, Peter Korsgaard
