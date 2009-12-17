From: Marcel <korgull@home.nl>
Date: Thu, 17 Dec 2009 21:31:19 +0100
Subject: [Buildroot] development environment
Message-ID: <200912172131.19962.korgull@home.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to create a workable environment to work with buildroot for the 
following :

I use a stable buildroot (which I may regularly upgrade) and will be adding 
kernel modules, board configurations and packages for my own design.
The documentation is very clear how to add the packages, so that's no issue.

The issue I have is that I want to use CVS for my own developed files and need 
to set up a workable environment to work efficiently to create patches for 
buildroot. On the other hand, just creating patches is not a real option as I 
should be able to compile just one kernel module in order to efficiently test it 
without requiring a full rebuild of the kernel. Rebuilding the kernel module 
would require me to edit the patched files within buildroot, but it's very hard 
to use CVS from that environment because my files are all over the place in 
buildroot. I can copy files, but this isn't very good practice either.

I've been trying some things over the past few days but every idea I come up 
with is very inefficient.

Does anyone have some tips regarding an efficient workflow ?

Best regards,
Marcel


 
