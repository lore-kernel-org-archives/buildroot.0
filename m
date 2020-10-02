From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2020 22:33:30 +0200
Subject: [Buildroot] [PATCH 2/2] package/gdb: also disable gprof
In-Reply-To: <20200928201128.78005-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 28 Sep 2020 22:11:27 +0200")
References: <20200928201128.78005-1-thomas.petazzoni@bootlin.com>
 <20200928201128.78005-2-thomas.petazzoni@bootlin.com>
Message-ID: <87blhk1i79.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When gdb is built from sources fetched from Git, it contains both the
 > gdb and the binutils code base. In order to really build only gdb, we
 > disable a number of binutils components in the
 > GDB_DISABLE_BINUTILS_CONF_OPTS variable: --disable-binutils,
 > --disable-ld, --disable-gas, etc. However, gprof was still being
 > built, so disable it as well.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
