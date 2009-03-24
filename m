From: Tobias McNulty <tobias@caktusgroup.com>
Date: Tue, 24 Mar 2009 18:40:12 -0400
Subject: [Buildroot] using linux 2.4 headers
Message-ID: <49C9614C.6010205@caktusgroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just downloaded the latest version of buildroot and managed to build a
very small file system that includes python and sqlite (exactly what I'm
looking for!) in no time at all.  Very impressed, thanks for all your
hard work everyone!

Now, pardon my ignorance, but is there a way to make buildroot use linux
2.4 headers instead of the default 2.6?  I only have 2 options when I go
to select the kernel headers, and they're both fairly recent iterations
of the 2.6 kernel.

I see that ?Clibc supports 2.4 or greater, but I don't see any mention
of 2.4 in the buildroot docs.

The file system I'm trying to build is for a TS-7400 (arm) and the 2.6
kernel support doesn't seem that great unfortunately.

Thanks
Tobias
-- 
Tobias McNulty
Caktus Consulting Group, LLC
P.O. Box 1454
Carrboro, NC 27510
(919) 951-0052
http://www.caktusgroup.com
