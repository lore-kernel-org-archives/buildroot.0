From: Ming-Ching Tiew <mingching.tiew@redtone.com>
Date: Tue, 22 Jan 2008 09:56:49 +0800
Subject: [Buildroot] strip problem
Message-ID: <033d01c85c9a$0d4713a0$8119fea9@MingChing>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have been having this big problem with the buildroot,
which I finally beginning to have some clues that it is likely 
due to the 'strip' problem.

I select sstrip from the make menuconfig, under the presumption
that it should only do it on the executables, and then
I find that the 'strings libcrypto.0.9.7.so |grep MD5_Init'
returns nothing.

It seems to allow sstrip to happen on shared library.

I don't know how many other places where such thing
is happen to the whole make scripts.

Wonder if anyone else has the same problem with me ?



--------------------------------------------
Important Warning! 

*************************** 

This electronic communication (including any attached files) may contain confidential and/or legally privileged information and is only intended for the use of the person to whom it is addressed. If you are not the intended recipient, you do not have permission to read, use, disseminate, distribute, copy or retain any part of this communication or its attachments in any form. If this e-mail was sent to you by mistake, please take the time to notify the sender so that they can identify the problem and avoid any more mistakes in sending e-mail to you. The unauthorised use of information contained in this communication or its attachments may result in legal action against any person who uses it.
