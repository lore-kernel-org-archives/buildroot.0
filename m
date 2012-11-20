From: John Tobias <john.tobias.ph@gmail.com>
Date: Mon, 19 Nov 2012 18:21:03 -0800
Subject: [Buildroot] Who calls to the defined function/s
Message-ID: <CACUGKYMDKMSvqrUgRhiKyaVm6S5z7a+RMa+3oyCXspU8OVVbYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,

I was trying to (fully) understand the dataflow of the buildroot's
Makefile. How/who parse/calls to the functions like:

HELLO_INSTALL_TARGET_CMDS
HELLO_BUILD_CMDS

$(eval $(generic-package))


So, How I can tell to the generic-package to call HELLO_TEST_CMDS too?

example:
define HELLO_TEST_CMDS
...
endef



Regards,

john
