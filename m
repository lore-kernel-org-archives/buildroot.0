From: Stanley <eva2002@gmail.com>
Date: Sat, 16 Jan 2010 07:18:28 +0800
Subject: [Buildroot] qextserialport
Message-ID: <ed7750811001151518r262d6eb4va303fc0824ec6e04@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anyone know how to add package into buildroot for qextserialport 1.1 (
http://sourceforge.net/projects/qextserialport/files/qextserialport/1.1/qextserialport-1.1.tar.gz/download)
for buildroot 2009.08?

the qextserialport package itself only have 2 commands to run.

qmake
make

after that we need to mannually move/copy the lib files in the build folder
to a LD_LIBRARY_PATH (in most cases should be /usr/lib or just lib) in order
to use it.

Since its not the same as most package, I am kind of lose in how to add the
package into buildroot.

Hope someone can help. Thanks in advance

Regards,
Stanley
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100116/2484bc26/attachment.htm>
