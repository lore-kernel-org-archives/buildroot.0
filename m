From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 22:12:11 +0200
Subject: [Buildroot] [PATCH v2 1/2] fs/common.mk: do not store original
 names and timestamps when creating GZIP rootfs
In-Reply-To: <20190716174214.11914-1-itsatharva@gmail.com> (Atharva Lele's
 message of "Tue, 16 Jul 2019 23:12:13 +0530")
References: <20190716174214.11914-1-itsatharva@gmail.com>
Message-ID: <8736igr8pw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Atharva" == Atharva Lele <itsatharva@gmail.com> writes:

 > We don't use the GZIP environment variable to store GZIP options
 > anymore. So explicitly add -n argument to the GZIP call to ensure
 > reproducibility.

 > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
 > Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
