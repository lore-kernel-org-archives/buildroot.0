From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 23:52:51 +0200
Subject: [Buildroot] [PATCH 14/23] gcc-initial, gcc-intermediate,
	gcc-final: optimize extraction
In-Reply-To: <20130703234559.663f27b0@skate> (Thomas Petazzoni's message of
 "Wed, 3 Jul 2013 23:45:59 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-15-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k3l7nwz6.fsf@dell.be.48ers.dk> <20130703234559.663f27b0@skate>
Message-ID: <877gh7nwek.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> I added a short comment that this is purely a disk space optimization,
 >> and committed - Thanks.

 Thomas> Besides the disk space optimization, I am also hoping that it reduces a
 Thomas> little bit the time to extract the tarball, but I haven't made
 Thomas> measurements to check if it was really the case.

Yes, that as well. I just wanted to make it clear that there's no
functional reason why we couldn't just extract it all.

-- 
Bye, Peter Korsgaard
