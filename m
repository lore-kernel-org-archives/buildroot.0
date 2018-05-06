From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 17:32:51 +0200
Subject: [Buildroot] [PATCH] package/patch: fix xattr option
In-Reply-To: <20180506115751.6317-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 6 May 2018 13:57:51 +0200")
References: <20180506115751.6317-1-yann.morin.1998@free.fr>
Message-ID: <87lgcwre8s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The name of fthe configure option is, and has always been,
 >  --enable-xattr, not --enable-attr. Otherwise, configure
 > whines:
 >     configure: WARNING: unrecognized options: --enable-attr

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
