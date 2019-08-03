From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 21:51:19 +0200
Subject: [Buildroot] [PATCH 08/13 v2] core: prepare for generating
 multiple kconfig fragments
In-Reply-To: <2795810574c68f60b6017a52f1cd63d4d0b12e87.1564431589.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 29 Jul 2019 22:19:58 +0200")
References: <cover.1564431589.git.yann.morin.1998@free.fr>
 <2795810574c68f60b6017a52f1cd63d4d0b12e87.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <87h86y81u0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We currently redirect the output of each helper function. This was nice
 > as long as we were generating single .mk and .in fragments.

 > But we are soon to need more .in fragments.

 > So, do the redirection inside the .in helpers.

 > We do not (currently) need to generate more than one .mk fragment, but
 > for consistency, do the redirection in the .mk helper too.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Vadim Kochan <vadim4j@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
