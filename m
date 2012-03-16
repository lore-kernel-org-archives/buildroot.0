From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Fri, 16 Mar 2012 11:36:27 +0100
Subject: [Buildroot] (no subject)
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67031019E4@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi all, 
 
I'm struggling some day's now to get Webkit 1.6.3 (and even some later
versions 1.7.xx.xx ) running on Arm Cortex-A8 (build with GCC 4.5.x, and
uclibc0.9.33 )

Compiling is not a problem, this works (with some patches, depending on
the version of weskit I build I build.)


BUT: I'm having random crashes (when run the GtkLauncher on the target),
that I can not explain, or find where it goes wrong.

It must be in one of the libraries, but because I do not have any
'repetitive' core-dumps, it is hard to figure out what is going on, when
looking at these core dumps. 

I guess some basic-stuff (like fore example, locking.. or whatever...
malloc/free... troubles) that is not working, it is to strange what
happens, in  these core-dumps i never see somthing that is pointing to
the same crash-reason.
 

NOTE: When I do compile Weskit-1.2.7 (that was working before) with the
same set of libraries/uclibc.... (as I use to build 1.6.3 now), I do get
'RANDOM'-crashes as well.

I've included some core-dumps trace-back's (hope this is not to big for
the mailing-list) maybe someone gets a idea where I can take a look at.

Regards, and thanks.
Noel



-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: crash1.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120316/fdf7e16a/attachment-0003.txt>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: crash2.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120316/fdf7e16a/attachment-0004.txt>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: crash3.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120316/fdf7e16a/attachment-0005.txt>
