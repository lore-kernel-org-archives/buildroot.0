From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 09:49:27 +0200
Subject: [Buildroot] [PATCH 1/5 v2] package/lua-flu: fix to use the
 system xattr header
In-Reply-To: <878t4wv32q.fsf@tkos.co.il> (Baruch Siach's message of "Fri, 24
 Aug 2018 06:46:53 +0300")
References: <cover.1530368468.git.yann.morin.1998@free.fr>
 <652be114258a3d7b5829303a5c9219a26bd62c08.1530368468.git.yann.morin.1998@free.fr>
 <876000253l.fsf@dell.be.48ers.dk> <878t4wv32q.fsf@tkos.co.il>
Message-ID: <87mut89rlk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > Peter Korsgaard writes:
 >>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> 
 >> > We can't carry a mercurial patch, because the luarocks package is not
 >> > organised with the same layout as the upstream package source tree is.
 >> 
 >> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 >> > Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
 >> > Cc: Francois Perrad <francois.perrad@gadz.org>
 >> 
 >> > ---
 >> > Changes v1 -> v2:
 >> >   - explain ENOATTR -> ENODATA conversion  (Thomas)
 >> >   - explain why it's not a hg patch  (Thomas)
 >> >   - reference upstream PR and commit
 >> 
 >> Committed to 2018.05.x, thanks.

 > Not in 2018.05.x as of 838ed3710a149 (uclibc: ldso/arc: fix LD_DEBUG
 > segv when printing R_ARC_NONE).

It is now in both 2018.05.x and 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
