From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:15:47 +0200
Subject: [Buildroot] [PATCH] package/ltrace: directly use s.b.o to fetch
 the archive
In-Reply-To: <20200524203925.27369-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 24 May 2020 22:39:25 +0200")
References: <20200524203925.27369-1-yann.morin.1998@free.fr>
Message-ID: <871rmzkdq4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > During the migration from alioth to gitlab, the git repository for ltrace
 > was not migrated. There is a repository on gitlab.com, own by the debian
 > maintainer, but that repository does not contain the sha1 we know of:
 >     https://gitlab.com/cespedes/ltrace

 > s.b.o. is the only known location so far to host the archive, so switch
 > to it.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
