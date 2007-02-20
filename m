From: Will Crozier <willjcroz@yahoo.co.uk>
Date: Tue, 20 Feb 2007 23:48:19 +0000 (GMT)
Subject: [Buildroot] target gdb fails to compile - needs libintl.a
Message-ID: <20070220234819.89233.qmail@web26015.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I get this error when buildroot tries to make a target
gdb build:

make[2]: Entering directory
`/home/will/devel-builds/xbox-media/buildroot/build_i686/gdb-6.3-target/gdb'
make[2]: *** No rule to make target
`../intl/libintl.a', needed by `gdb'.  Stop.
make[2]: Leaving directory
`/home/will/devel-builds/xbox-media/buildroot/build_i686/gdb-6.3-target/gdb'
make[1]: *** [all-gdb] Error 2
make[1]: Leaving directory
`/home/will/devel-builds/xbox-media/buildroot/build_i686/gdb-6.3-target'
make: ***
[/home/will/devel-builds/xbox-media/buildroot/build_i686/gdb-6.3-target/gdb/gdb]
Error 2

I have libintl, gettext and locale support enabled in
my .config but I have checked for the intl/ directory
where it is looking for it and it does not exist. The
gcc and binutils toolchain build dirs have the intl/
but gdb dir does not.

Has anyone else had this issue?

Regards,

Will  



		
___________________________________________________________ 
What kind of emailer are you? Find out today - get a free analysis of your email personality. Take the quiz at the Yahoo! Mail Championship. 
http://uk.rd.yahoo.com/evt=44106/*http://mail.yahoo.net/uk 
