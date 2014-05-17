From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 May 2014 23:30:10 +0200
Subject: [Buildroot] [PATCH] package/duma: do not let MAkefile guess OS
In-Reply-To: <1400348090-29954-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 17 May 2014 19:34:50 +0200")
References: <1400348090-29954-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ha4om6u5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > We ened to tell the duma Makefile what OS we're gonna run on, or it
 > uses default values.

 > It turns out the default values are the same as for OS=linux (and so
 > this change should be a no-op), but it's just better to force it, and
 > it avoids a warning during the build.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed with the typos fixed, thanks.

-- 
Bye, Peter Korsgaard
