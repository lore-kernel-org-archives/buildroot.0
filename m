From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Aug 2019 22:52:35 +0200
Subject: [Buildroot] [PATCH 1/6] package/gdb: remove gdb 7.12.1
In-Reply-To: <20190802130937.12591-1-romain.naour@smile.fr> (Romain Naour's
 message of "Fri, 2 Aug 2019 15:09:31 +0200")
References: <20190802130937.12591-1-romain.naour@smile.fr>
Message-ID: <87k1bvqoh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > gdb 7.12.1 was released on 21 Jan 2017 [1] and is the last version
 > that doesn't requires a C++11 compiler. Since Buildroot now support
 > tree gdb version (8.1, 8.2 and 8.3), reduce the number of choice by
 > droping 7.12.1.

 > Remove BR2_PACKAGE_GDB_NEEDS_CXX11 symbol since it's not useful
 > anymore.

 > [1] https://lists.gnu.org/archive/html/info-gnu/2017-01/msg00009.html

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
