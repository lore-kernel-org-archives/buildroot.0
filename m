From: Mike Sander <msander@ripnet.com>
Date: Fri, 20 Jun 2008 22:12:19 -0400
Subject: [Buildroot] buildroot snapshot
Message-ID: <485C6383.8010806@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Could someone confirm (or not) my understanding of how a snapshot works 
when used at a later date.  I have looked at sources and read the docs 
but I still do not have a definitive answer.

I am using buildroot-20080428 snapshot on my current development box.   
If I install this same snapshot on another machine today [and configure 
for the same target]  would it be reasonable to expect the same 
toolchain & other bits [kernel, file system(s) etc] to be identical 
(again, assuming identical .config files).   I believe this to be the case.

I guess I am looking for confirmation that the snapshot contains 
specific versions of packages and patches, and these same ones will be 
used even if the snapshot is run at a later date.

Regards,

Mike
