From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 22:12:21 +0200
Subject: [Buildroot] [PATCH v2 2/2] Makefile: don't export GZIP
 environment variable
In-Reply-To: <20190716174214.11914-2-itsatharva@gmail.com> (Atharva Lele's
 message of "Tue, 16 Jul 2019 23:12:14 +0530")
References: <20190716174214.11914-1-itsatharva@gmail.com>
 <20190716174214.11914-2-itsatharva@gmail.com>
Message-ID: <87y308pu56.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Atharva" == Atharva Lele <itsatharva@gmail.com> writes:

 > We export GZIP = -n so that GZIP does not record original
 > name and timestamps. However..

 > GZIP environment variable is deprecated and soon will not be
 > supported in future GZIP versions. GZIP suggests the use of a
 > wrapper to pass options globally but it might be difficult to
 > implement in Buildroot. For now, we don't export the variable
 > and fix reproducibility issues per package as they show up in
 > Autobuilder.

 > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
 > Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 > Changes v1 -> v2:
 >   - Reversed order of patches

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
