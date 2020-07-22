From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 14:27:58 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/cryptodev-linux: bump to
 version f2927e3
In-Reply-To: <20200720211114.689018-1-alejandro.gonzalez.correo@gmail.com>
 ("Alejandro =?utf-8?Q?Gonz=C3=A1lez=22's?= message of "Mon, 20 Jul 2020
 23:11:14 +0200")
References: <20200720211114.689018-1-alejandro.gonzalez.correo@gmail.com>
Message-ID: <87mu3rg2ep.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alejandro" == Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com> writes:

 > This version mainly fixes build issues with more
 > recent kernels.

 > 98b163a cryptlib.c: fix build on kernel v5.5+
 > 7e72f67 enabled the support for TLS1.1 - AES128-SHA1 - AES256-SHA1
 > 9e76506 Fix build for Linux 5.8-rc1

 > Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>

 > ---
 > Changes v1 -> v2:
 > 	- Fix download tarball hash

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
