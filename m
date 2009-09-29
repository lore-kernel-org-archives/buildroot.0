From: Lars Lockenvitz <l.lockenvitz@fpga-art.de>
Date: Tue, 29 Sep 2009 09:48:15 +0200
Subject: [Buildroot] libicui18n Use GCC option -fPIC
Message-ID: <4AC1BBBF.90908@fpga-art.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I try to use midori and get only this error befor midor abort.

Can't modify /usr/lib/libicui18n.so.38's text section. Use GCC option 
-fPIC for shared objects, please.

Now, I don't know if libicui18n.so.38 is compiled withouch -fPIC or midori.
And if it is midori, how can I change that? Midori does not have a 
typical configure or makefile!

Does someone know what to do?

-- 
Mit freundlichen Gr??en / Best Regards
Lars Lockenvitz

Ingenieurb?ro Sibities     T: 08157 / 90 10 82
Heinrich-Knote-Str. 3a     F: 08157 / 90 10 81
82343 P?cking              W: www.fpga-art.de 
