From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jan 2021 17:58:32 +0100
Subject: [Buildroot] [PATCH] boot/lpc32xxcdl: switch upstream location
In-Reply-To: <20201229105653.3156279-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 29 Dec 2020 11:56:53 +0100")
References: <20201229105653.3156279-1-yann.morin.1998@free.fr>
Message-ID: <87r1n08wqv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The upstream git tree has disapeared, but a ZIP file is still hosted
 > somewhere at NXP,. The content of that zip file has been verified to
 > be 100% identical to the tarball we hosted on s.b.o.

 > As this is a zip file, we can't use the generic extract commands, and
 > must come up with our own. As such, it no longer makes sense to fix the
 > CRLF as a post-extract hook; this is moved to the extract command.

 > Add a hash file while at it.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Maybe we should just get rid of it? It is not referenced by any of our
defconfigs.

In the mean time,

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
