From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 11:56:23 +0200
Subject: [Buildroot] [PATCH] qt5base: remove unused definition
In-Reply-To: <20180630125713.4302-1-gael.portay@savoirfairelinux.com>
 (=?utf-8?Q?=22Ga=C3=ABl?=
 PORTAY"'s message of "Sat, 30 Jun 2018 08:57:13 -0400")
References: <20180630125713.4302-1-gael.portay@savoirfairelinux.com>
Message-ID: <877elrft14.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ga?l" == Ga?l PORTAY <gael.portay@savoirfairelinux.com> writes:

 > Since commit 81fb33af2a (qt5base: correct eglfs support in
 > qmake.conf.in) the definition QT5BASE_CONFIGURE_QMAKE_CONFIG is left
 > unused.

 > Remove it since it is not used anymore.

 > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
