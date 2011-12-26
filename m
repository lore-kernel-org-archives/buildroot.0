From: Alain-Serge Nagni <alainsergenagni@yahoo.com>
Date: Mon, 26 Dec 2011 09:03:11 -0800 (PST)
Subject: [Buildroot] Issue with Xorg: i cannot generate and xorg.conf file
Message-ID: <1324918991.39069.YahooMailNeo@web124920.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
??? I have an issue with Xorg. I'm using buildroot-2011.11, and i did build Xorg as part the modules for the embeded system that I'm constructing. The target CPU is an Intel Atom 1.1 GHz and I I have a 4GB Compact Flash (CF).


After completing the build and loading the system on my CF, I booted the system. The system did boot properly and I logged in as "root".


? 

I did execute the command " Xorg -configure" to generate the "xorg.config" file but the command failed: No xorg.conf will be generated and the screen will remain black. That is strange. 

But when I executed the command "startx", xwindows started without any problem. I could run Xwindows applications without any problem.


Normally on Desktop sytem, if you are not able to execute the command " Xorg -configure" you will not be able to start Xwindows. So I'm asking myself what should I be doing differently with buildroot to generate the xorg.conf file?


Do anybody knows what is going on and how can I solve the issue? Thanks for your help.


I did attached to this email, my build root configuration file and the Xorg output.


Thanks for your help,
:-)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111226/fd5c624c/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot.config
Type: application/octet-stream
Size: 27688 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111226/fd5c624c/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Xorg.0.log
Type: application/octet-stream
Size: 11725 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111226/fd5c624c/attachment-0003.obj>
