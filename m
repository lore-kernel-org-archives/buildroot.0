From: Bernhard Fischer <rep.nop@aon.at>
Date: Sun, 10 Dec 2006 15:15:37 +0100
Subject: [Buildroot] ARM softfloat patch for gcc 4.2
In-Reply-To: <789554.43861.qm@web35609.mail.mud.yahoo.com>
References: <789554.43861.qm@web35609.mail.mud.yahoo.com>
Message-ID: <20061210141537.GD4442@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 08, 2006 at 07:21:14PM -0800, Andre wrote:
>Tested with gcc 4.2 20061205 snapshot + binutils 2.17
>
>Seems to work with one minor issue: although the newly created
>arm-linux-uclibc-gcc defaults to -mfloat-abi=soft, binutils does not.

There are (at least) two upstream bugs about arm softfloat:
gcc.gnu.org/PR16314
gcc.gnu.org/PR14352

Richard is the arm arch maintainer, so please discuss the problems there
and also fix it there.
thanks,
