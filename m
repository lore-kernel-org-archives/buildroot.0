From: Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
Date: Mon, 26 Apr 2010 12:33:06 +0545
Subject: [Buildroot] glib error with toolchian from buildroot
Message-ID: <l2y532dd5841004252348ia42beb1eq7dbb20c1be0fc0ef@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
Im using the buildroot daily git snapshot  . i built a jffs2
filesystem image for my target board at91sam9261ek. however some of
the GTK  applications are not running in the target
like  gqview , gtkperf n all.
 the error says

 GLib:ERROR:gstrfuncs.c:435:IA__g_ascii_strtod: assertion failed:
(decimal_point_len != 0)
Aborted


 i also tried to compile a simple GTK application from toolchain
generated from buildroot which creates a simple window dialog . it
compiles but when it runs  in target it gives above error .
may i know wat exactly is wrong?
warm regards,
Ravi Kulkanri.
