From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 11:07:07 +0200
Subject: [Buildroot] [PATCH] package/fakeroot: fix highly parallel uses
In-Reply-To: <20170813214834.24093-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 13 Aug 2017 23:48:34 +0200")
References: <20170813214834.24093-1-yann.morin.1998@free.fr>
Message-ID: <87bmmoi4as.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Although the issue can very well occur with low-paralle builds, or even
 > with non-parallel builds, the conditions are so strict that the ocasion
 > it breaks is extremely rare, to the point where a failure would go
 > unnoticed.

 > Fixes #10141.

 > Reported-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
