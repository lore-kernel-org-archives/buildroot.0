From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Apr 2014 00:04:58 +0200
Subject: [Buildroot] [PATCH 3/6] tzdata: allow host build
In-Reply-To: <e9034753bdf5bfff2e3d60a23232356d23ee0282.1396900553.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 7 Apr 2014 21:58:05 +0200")
References: <cover.1396900553.git.yann.morin.1998@free.fr>
 <e9034753bdf5bfff2e3d60a23232356d23ee0282.1396900553.git.yann.morin.1998@free.fr>
Message-ID: <87ha63a35g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
 > uClibc uses its own format for timezone info. OTOH, we can generate
 > uClibc-compatible timezone info from existing tzdata.

 > Add a host-version of tzdata, so we can harvest its installed timezone
 > info.

 > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

It would be good if we could reuse more of the target logic for this,
but that can be cleaned up later.

Committed, thanks.

-- 
Bye, Peter Korsgaard
