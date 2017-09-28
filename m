From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Sep 2017 22:04:06 +0200
Subject: [Buildroot] [PATCH] package/libmad: don't install .pc in target
In-Reply-To: <20170928180621.24797-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 28 Sep 2017 20:06:21 +0200")
References: <20170928180621.24797-1-yann.morin.1998@free.fr>
Message-ID: <877ewik2tl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We explicitly remove pkg-config files from target in the target-finalize
 > step, and our pkg-config looks for .pc files from staging, not target.

 > So, explicitly installing the .pc in target is useless.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
