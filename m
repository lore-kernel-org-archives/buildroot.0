From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 11 Jul 2018 05:38:29 +0200
Subject: [Buildroot] How to deal configure file getting wrong include
 path
References: <CAEEV9O1YdQyWb6sBpgfs=Vu2ZmMvyBrdjTzJvMbKHizADKbcvQ@mail.gmail.com>
Message-ID: <lmag1fxg4u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mark,

Am Tue, 10 Jul 2018 18:43:14 -0500 schrieb Mark Hawthorne:

> I added a package to build spatialite. Spatialite depends on the geos
> library. At build time, the geos library generates a script called
> geos-config which can be used to query the installation location for the
> geos header files and libraries. Geos determines these locations at
> build time using $exec and $exec_prefix and hard-codes them into the
> geos-config file. The include path becomes "/usr/include".

have a look at the buildroot docs and search for LIBFOO_CONFIG_SCRIPTS.
This should handle your problem.

Regards, Bernd
