From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Sep 2014 23:09:28 +0200
Subject: [Buildroot] where is libdns_sd.so?
In-Reply-To: <87vbof2xnf.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 22 Sep 2014 22:44:20 +0200")
References: <CAK9TtU2BUcZpPVnvGAsYXShYr+ctAR-g2k3KLXgGG_kALPBNMg@mail.gmail.com>
 <87vbof2xnf.fsf@dell.be.48ers.dk>
Message-ID: <87r3z32whj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 > the bonjour compatibility library is not built by default, but needs be
 > explicitly be enabled at configure time with --enable-compat-libdns_sd.

 > We don't currently have a Buildroot option to enable this, but I'll add
 > it now.

Added in git:

http://git.buildroot.net/buildroot/commit/?id=1ab5a23e730a19dece727ffe59ae97b65d0a1ccc

-- 
Bye, Peter Korsgaard
