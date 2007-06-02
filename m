From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Sat, 02 Jun 2007 10:18:29 +0100
Subject: [Buildroot] Flite for build root
Message-ID: <466135E5.8000603@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Attached is a patch to add flite applications to the build-root system.  
There are a few issues with flite and I have e-mailed the developers 
about and will feed back any patches and changes I make for build-root 
here.  Currently I can build flite and run it on my target Via C3 
hardware.  Flite currently only produces a static library files but 
these do not need to go on the target only the final executable.  The 
building on shared libraries is currently broken and I am trying to see 
if there are fixes for this.  Also the install target for flite is 
broken so I have created my own.  Please excuse the 'shell' sillyness it 
was the simplest architecture independent way I could think of to 
install the library files into the staging directory.  I'm sure it could 
be made more efficient but for me it works.

Again I can only test on 386 hardware and somebody else test on other 
hardware platforms?

Regards,
Rod Boyce
-------------- next part --------------
A non-text attachment was scrubbed...
Name: flite.patch
Type: text/x-patch
Size: 3629 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070602/4a7cb32b/attachment-0001.bin 
