From: Bernhard Fischer <rep.nop@aon.at>
Date: Mon, 18 Dec 2006 11:53:44 +0100
Subject: [Buildroot] linux/limits.h: No such file or directory
In-Reply-To: <200612180109.31737.thilo@riessner.de>
References: <200612180109.31737.thilo@riessner.de>
Message-ID: <20061218105344.GB5569@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 18, 2006 at 01:09:31AM +0100, Thilo Riessner wrote:
>When building buildroot, I get the error message 
>linux/limits.h: No such file or directory
>while compiling the file 
>toolchain_build_i486/uClibc_dev//usr/include/bits/local_lim.h
>Did I mess something up or is this a bug in buildroot?
>Many thanks for any help 

Make sure to use the current buildroot (revision 16988 at the time of
this writing). Also you have to indicate what version of uClibc and
kernel-headers you're using.
