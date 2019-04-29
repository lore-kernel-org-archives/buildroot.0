From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Apr 2019 09:02:55 +0200
Subject: [Buildroot] [PATCH] package/qemu: unset TARGET_DIR
In-Reply-To: <20190428174359.8908-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 28 Apr 2019 19:43:59 +0200")
References: <20190428174359.8908-1-yann.morin.1998@free.fr>
Message-ID: <87r29ls38g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > qemu uses TARGET_DIR internally, and it is at least used to display the
 > shortened compiling commands, like (with a TARGET_DIR=/path/to/target):

 >     CC /path/to/targetblock/write-threshold.o

 > There does not seem to be any adverse effect to that, but this is very
 > confusing to see, especially when building the host variant.

 > Fix that by unsetting TARGET_DIR prior to building.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
