From: Michael <michtw@gmail.com>
Date: Tue, 10 Oct 2006 20:53:51 +0800
Subject: [Buildroot]  How can i compile bash3.1 with uclibc
Message-ID: <901e5e350610100553h55cfebffwb1394770ea759f9a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You should add the following option to gcc.

CFLAGS+=-Dfork=vfork
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061010/b71ef139/attachment.htm 
