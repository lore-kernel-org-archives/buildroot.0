From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Mar 2014 23:48:14 +0100
Subject: [Buildroot] [PATCH] sdl: Fix host variant dependencies
In-Reply-To: <1395959262-25285-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Thu, 27 Mar 2014 23:27:42 +0100")
References: <1395959262-25285-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <878urvgswh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > The host variant of sdl inherited the dependencies and conf opt from
 > sdl which could lead to some trouble.

 > For example:
 >   If you were to build host-sdl and had alsa-lib enabled in your
 >   packages list, it would try to build host-alsa-lib which does not
 >   exists.

 > This patch define basic dependencies and conf opt for the host variant.

 > Reported-by: Eric Limpens <limpens@gmail.com>
 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
