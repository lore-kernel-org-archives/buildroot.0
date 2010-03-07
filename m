From: Paul Jones <paul.jones@iwtech.com.au>
Date: Sun, 07 Mar 2010 23:53:02 +1100
Subject: [Buildroot] Login troubles
Message-ID: <4B93A1AE.8070406@iwtech.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've just built a basic buildroot for my mini2440 ARM board and it 
successfully boots to the buildroot login: prompt.
My problem is that I can't seem to login - I haven't touched any of the 
config files and looking at /etc/passwd|shadow the login should be root 
with a blank password?
I've tried to login both from the serial console (which I set in the 
buildroot menu to /dev/ttySAC0) and the normal console with a usb 
keyboard - no luck.

This is what I get when it boots:

VFS: Mounted root (yaffs filesystem) on device 31:2.
Freeing init memory: 128K
Initializing random number generator... done.
Starting network...
ip: RTNETLINK answers: File exists


Welcome to Buildroot

buildroot login: root
Password:
Login incorrect
