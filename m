From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 15:40:25 +0200
Subject: [Buildroot] [PATCH] package/open2300: fix static builds
In-Reply-To: <1467637517-14388-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 4 Jul 2016 15:05:17 +0200")
References: <1467637517-14388-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87poqtfrna.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > libmysqlclient needs -lz to build, so we have to pass it explicitly for
 > static builds.

 > For almost-two-and-a-half years this error has been happenning, noone
 > ever tried to fix it. This is now done, at last! ;-]

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed after adding a reference to the autobuilders, thanks.

-- 
Bye, Peter Korsgaard
