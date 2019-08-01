From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 10:18:58 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/gcc: drop negative
 conditions on C-SKY for older versions
In-Reply-To: <f55f05c0066b6dabbcd21f68883319ff1050f478.1563483980.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 18 Jul 2019 23:06:28 +0200")
References: <cover.1563483980.git.yann.morin.1998@free.fr>
 <f55f05c0066b6dabbcd21f68883319ff1050f478.1563483980.git.yann.morin.1998@free.fr>
Message-ID: <871ry547t9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Now that the C-SKY architecture requires gcc-9, we can drop the special
 > conditions on the individual older versions.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Guo Ren <guoren@kernel.org>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Acked-by: Guo Ren <guoren@kernel.org>

 > ---
 > Changes v1 -> v2:
 >   - add Guo's acked-by

Committed, thanks.

-- 
Bye, Peter Korsgaard
