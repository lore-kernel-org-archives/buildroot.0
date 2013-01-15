From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Tue, 15 Jan 2013 12:12:54 +1100
Subject: [Buildroot] New kernel source mode [Proposal]
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I'd like to get some feedback on a feature I'd like to contribute to the
buildroot project. I'm not quite sure what the process is so I thought
I'd start on the mailing list.

 

 

PROPOSAL:  Allow a directory (containing the source tree) to be used as
the source for the kernel build. The source isn't copied to the output
directory but instead the kernel's outputmakfile wrapper facility is
used.

 

RATIONALE:  In my project, changes to the kernel are frequent enough
that it is ideal to be able to update the kernel source tree and then
build directly from it.

 

IMPLEMENTATION:  In addition to providing a new source for the linux
build process itself, some package makefiles will need to be updated as
they currently don't differentiate between the kernel source tree and
build tree.

 

 

I have this working already though I still need to update some of the
packages as mentioned above. I wanted to ask if there would be any
interest in rolling this into the buildroot project upstream.

 

Thanks for your feedback.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130115/2bcaf14f/attachment.html>
