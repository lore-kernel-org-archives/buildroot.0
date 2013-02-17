From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Feb 2013 22:49:31 +0100
Subject: [Buildroot] [PATCH] libvorbis: fix LIBVORBIS_SITE
In-Reply-To: <1360792556-4732-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 13 Feb 2013 22:55:56 +0100")
References: <1360792556-4732-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874nhaobkk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The LIBVORBIS_SITE included a reference to $(LIBVORBIS-SOURCE), which
 Thomas> doesn't exist. And anyway was useless because the <pkg>_SITE variable
 Thomas> should not contain the name of the tarball.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
