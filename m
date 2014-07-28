From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Jul 2014 23:17:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/lftp: inverse the
	openssl/gnutls selection
In-Reply-To: <cab592c4187ed5d711a72400bdbfa831ca5bb968.1406581025.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 28 Jul 2014 22:58:07 +0200")
References: <cover.1406581025.git.yann.morin.1998@free.fr>
 <cab592c4187ed5d711a72400bdbfa831ca5bb968.1406581025.git.yann.morin.1998@free.fr>
Message-ID: <874my19o8r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > openssl is more widely used than gnutls. Other packages prefer openssl
 > over gnutls and would like to do the select in the opposite direction.

 > So switch lftp to use openssl by default, and only revert to using
 > gnutls if explicitly selected by the user.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
