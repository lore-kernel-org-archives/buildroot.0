From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:13:55 +0200
Subject: [Buildroot] [PATCH v2] package/dropbear: rework license
 information
In-Reply-To: <20190529070701.8913-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Wed, 29 May 2019 09:07:01
 +0200")
References: <20190529070701.8913-1-yegorslists@googlemail.com>
Message-ID: <87y32n1tgc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > According to the LICENSE file curve25519-donna is licensed under
 > BSD-3-Clause license.

 > There is only BSD-2-Clause license mentioned so remove
 > BSD-2-Clause-like.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 > Changes v1 -> v2:
 >   - remove BSD-2-Clause-like license (suggested by Arnout Vandecappelle)

 >  package/dropbear/dropbear.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
