From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 11:03:20 +0200
Subject: [Buildroot] [PATCH] socat: bump to version 2.0.0-b6
In-Reply-To: <1381023587.2508.3.camel@phoenix> (Axel Lin's message of "Sun, 06
 Oct 2013 09:39:47 +0800")
References: <1381023587.2508.3.camel@phoenix>
Message-ID: <8761tahiuf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> 2.0.0-b6 fix a security issue:

 Axel> Under certain circumstances an FD leak occurs and may be misused
 Axel> for denial of service attacks against socat running in server
 Axel> mode.

 Axel> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
