From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Jan 2017 17:08:00 +0100
Subject: [Buildroot] [PATCH] libvncserver: security bump to version
	0.9.11
In-Reply-To: <20170106125240.5764-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 6 Jan 2017 13:52:40 +0100")
References: <20170106125240.5764-1-peter@korsgaard.com>
Message-ID: <87vatsrx27.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Security related fixes:
 > - Heap-based buffer overflow in rfbproto.c in LibVNCClient in LibVNCServer
 >   before 0.9.11 (CVE-2016-9941)

 > - Heap-based buffer overflow in ultra.c in LibVNCClient in LibVNCServer
 >   before 0.9.11 (CVE-2016-9942)

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
