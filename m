From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 20:08:23 +0200
Subject: [Buildroot] [PATCH] systemd: Fix polkit build order
In-Reply-To: <20180704203624.12391-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 4 Jul 2018 22:36:24 +0200")
References: <20180704203624.12391-1-yann.morin.1998@free.fr>
Message-ID: <87r2jzcd48.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Asgeir Bjarni Ingvarsson <asgeir@appdynamic.com>
 > We need to install polkit before systemd if we want to enable
 > polkit integration, because systemd will not install polkit
 > policy files unless it finds polkit-gobject-1.

 > Signed-off-by: Asgeir Bjarni Ingvarsson <asgeir@appdynamic.com>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > I've resent this, as Asgeir does not seem to be subscribed to the list.
 > Asgeir, if you want to send more patches (which we encourage you to
 > do!), you'll need to subscribe to the list first.

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
