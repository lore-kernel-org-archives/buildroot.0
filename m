From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 14:17:43 +0200
Subject: [Buildroot] [PATCH 5/5] package/mariadb: fix build error with
 newer cmake
In-Reply-To: <20190915193559.8464-5-bluemrp9@gmail.com> (Ryan Coe's message of
 "Sun, 15 Sep 2019 12:35:59 -0700")
References: <20190915193559.8464-1-bluemrp9@gmail.com>
 <20190915193559.8464-5-bluemrp9@gmail.com>
Message-ID: <87a7am566w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > When using a newer host system cmake to build MariaDB, the following build
 > error occurs:

 > CMake Error at cmake/os/Linux.cmake:29 (STRING):
 > STRING sub-command REPLACE requires at least four arguments.
 > Call Stack (most recent call first):
 > CMakeLists.txt:101 (INCLUDE)

 > CMake Error at cmake/os/Linux.cmake:29 (STRING):
 > STRING sub-command REPLACE requires at least four arguments.
 > Call Stack (most recent call first):
 > CMakeLists.txt:101 (INCLUDE)

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=11781

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
