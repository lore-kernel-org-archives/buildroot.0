From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Sat, 02 Jun 2007 11:00:30 +0100
Subject: [Buildroot] ALSA tools for build-root
Message-ID: <46613FBE.7080709@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I have also added alsa-tools to build-root and attached is the patch.  
These tools have a lot of dependencies that I am not using the tools 
that build fine for me I have defaulted to 'default y' in the Config.in 
file, all tools that depend on X, GTK, or some other library I am not 
using I have set 'default n' there are also tools that are going to 
require a custom target that my makefile does not do anything with these 
are all commented out in the config file.  The makefile is quite simple 
I have a macro that creates a target for each simple selected tool the 
tools are selected from the configure script this was the simplest way I 
could think of doing the simple targets for this tool set.  I have not 
looked at what is needed for the more complicated targets and I don't 
plan on using then.  But I have left them in for the next to make the 
job easier for the next person hopefully.

Regards,
Rod Boyce
-------------- next part --------------
A non-text attachment was scrubbed...
Name: alsa-tools.patch
Type: text/x-patch
Size: 9814 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070602/c5a914fa/attachment.bin 
