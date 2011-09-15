From: stl <st.lambert02@gmail.com>
Date: Thu, 15 Sep 2011 11:20:44 +0200
Subject: [Buildroot] Questions related to "Incorrect selection of the C
 library" error
In-Reply-To: <201109141820.00295.arnout@mind.be>
References: <CAOPDcRz+PpksWoMJBh5mzk8+E7YcdKj=httB1nxajGanmKTNow@mail.gmail.com>
 <20110914115217.5a64e8d0@skate> <201109141820.00295.arnout@mind.be>
Message-ID: <CAOPDcRwGMUaA0SuGc09XiQoweF9aMwbSeYKqoD4wj_NwY+i9Rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas and Arnout, thanks for your answers.

Effectively, my port of uClibc is not installed in the same directory than
my toolchain.
Because, the version of the toolchain I use is compiled with newlib as C
library, instead of uClibc.

And my problem with the ld-uclibc.so.* comes from I have not done anything
yet that deals with
dynamic linker in my port of uClibc.

It seems that some work remains to be done...

Ok I going to dig all these things.

Thanks again for your help.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110915/4000a280/attachment.html>
