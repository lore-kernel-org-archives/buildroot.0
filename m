From: mike sander <msander@ripnet.com>
Date: Wed, 18 Jun 2008 22:49:25 -0400
Subject: [Buildroot] relocate working buildroot
Message-ID: <4859C935.9030800@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Is anyone able to comment on how best to relocate and/or copy a working 
buildroot?

I have tried it (relocate to new location on same box) and did a "make 
clean" followed by "make".   Very soon I got failures due to not being 
able to delete some files at the original location.

With a bit of grepping I discovered that the original configuration full 
path is in numerous (i.e. too many to fix manually) locations throughout 
buildroot related files.     

Are there some specific (maybe hidden) buildroot files that could be 
deleted to force the configuration stage to pick up the new path?   

Thanks in advance,

Mike Sander
