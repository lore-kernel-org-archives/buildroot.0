From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 20:22:28 +0200
Subject: [Buildroot] [PATCH 2/2 v7] package/iputils: use capabilities if
 possible
In-Reply-To: <7357ef816dae35990f461175f35135fb4996eb54.1564676540.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 1 Aug 2019 18:22:33 +0200")
References: <cover.1564676540.git.yann.morin.1998@free.fr>
 <7357ef816dae35990f461175f35135fb4996eb54.1564676540.git.yann.morin.1998@free.fr>
Message-ID: <875zngvj8b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Petr Vorel <petr.vorel@gmail.com>
 > If support for extended attributes is enabled, then we can use them to
 > store capabilities. If not, we keep using the setuid bit.

 > arping does not get a capability, as it can be used for arp poisoning.

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 > [yann.morin.1998 at free.fr:
 >   - resort to using q full-fledged conditional block
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > ---
 > Changes v6 -> v7:
 >   - use a full if-block

Committed, thanks.

-- 
Bye, Peter Korsgaard
