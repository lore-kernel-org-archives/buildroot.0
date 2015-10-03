From: Herman Theron <herman.theron@gmail.com>
Date: Sat, 3 Oct 2015 20:28:54 +0200
Subject: [Buildroot] Help needed in compiling python cryptography module
Message-ID: <CABC2aiqvRmmTsfJ4aoA9zbScrM-nRrquLG-WYSQFGTaiYN1ZUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Buildroot list,

I'm trying to create a  Buildroot package for the Crossbar.io python
software. This package has a lot of dependencies, and I'm slowly working
through them.

I'm picking up a similar issue as
http://lists.busybox.net/pipermail/buildroot/2015-March/121816.html
<https://her-webmail.sansa.org.za/owa/redir.aspx?C=ef424837439d4f8283da45e6a6a2085f&URL=http%3a%2f%2flists.busybox.net%2fpipermail%2fbuildroot%2f2015-March%2f121816.html>
 in compiling python-cryptography (development platform is 64bit Ubuntu,
cross compiling for 32-bit) - the wrong cffi backend is chosen: "wrong ELF
class: ELFCLASS32" (cffi compiled fine for the correct architecture,
cryptography is using the host info.)

Can anybody in assisting to get a python-cryptogarphy module to correctly
crosscompile?

Regards

Herman
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151003/88cd0adb/attachment.html>
