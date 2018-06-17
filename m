From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:52:42 +0200
Subject: [Buildroot] [PATCH] docs/manual: always point to the correct
 license file
In-Reply-To: <20180602080101.23051-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 2 Jun 2018 10:01:01 +0200")
References: <20180602080101.23051-1-yann.morin.1998@free.fr>
Message-ID: <877emxpfzp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The manual is GPL-2, and points to the COPYING file in the repository.
 > When we do a rendering of the manual for a specific version, that URL
 > is currently always poitning to the latest version of the COPYING file.

 > If we ever have to change the content of that file (e.g. to add a new
 > exception, more clarifications, a license change, or whatever), then
 > an old manual would point to that newer version, which would then be
 > incorrect.

 > Include the sha1 of the commit in the URL, so that the manual always
 > point to the tree at the time the manual was rendered, not the time
 > it is consulted. Contrary to the informative text above, use the full
 > sha1, not the shortened one.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > Cc: Luca Ceresoli <luca@lucaceresoli.net>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
