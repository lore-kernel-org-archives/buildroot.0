From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 14:15:57 +0200
Subject: [Buildroot] [PATCH 1/5] package/mariadb: use host-openssl from
 buildroot-system
In-Reply-To: <20190915193559.8464-1-bluemrp9@gmail.com> (Ryan Coe's message of
 "Sun, 15 Sep 2019 12:35:55 -0700")
References: <20190915193559.8464-1-bluemrp9@gmail.com>
Message-ID: <87eezy569u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > From: Peter Seiderer <ps.report@gmx.net>
 > - change WITH_SSL for host build from bundled to system (and add
 >   host-openssl dependency) to avoid the following configure failure:

 >   CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
 >     Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
 >     (Required is at least version "3.3.24")
 >   Call Stack (most recent call first):
 >     /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
 >     /usr/share/cmake/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
 >     libmariadb/CMakeLists.txt:298 (FIND_PACKAGE)

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > Tested-by: Ryan Coe <bluemrp9@gmail.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
