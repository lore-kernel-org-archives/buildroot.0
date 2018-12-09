From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 09 Dec 2018 21:55:05 +0100
Subject: [Buildroot] [PATCH] configs/chiliboard: remove explicit getty
 port
In-Reply-To: <20181121210142.21769-1-m.niestroj@grinn-global.com> (Marcin
 Niestroj's message of "Wed, 21 Nov 2018 22:01:42 +0100")
References: <20181121210142.21769-1-m.niestroj@grinn-global.com>
Message-ID: <875zw21kuu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:

 > Using default value (console) works well, so there is no reason to set
 > tty explicitly. Additionally after selecting newer kernels (tested
 > with 4.19 and 4.20-rc3) ttyO0 no longer works due to missing device
 > node.

Do you know why this is so? Did ttyO0 get renamed?

Committed, thanks.

-- 
Bye, Peter Korsgaard
