From: Mirko ROCCO <mirko.rocco@gmail.com>
Date: Fri, 27 Mar 2009 09:52:58 +0100
Subject: [Buildroot] target/Makefile.in problem
Message-ID: <10d6046f0903270152p681242fekf02862a27d0797ab@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I have downloaded the last snapshot of buildroot by means of svn...
After menuconfig(-uration) for target PowerPC I give "make source" command
but the compilation right there fails with this error:

target/Makefile.in:22: Extraneous text after `else' directive
target/Makefile.in:38: *** only one `else' per conditional. Stop.

So I have modified Makefile.in, adding a new line after `else' in line 22.
The error became:

target/Makefile.in:86: *** missing `endif'. Stop.


So I wondering: Am I following the right way? Is It right to modify
Makefile.in?

Thanks for any suggestion in advance!

Mirko ROCCO
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090327/e6689ef7/attachment.htm>
