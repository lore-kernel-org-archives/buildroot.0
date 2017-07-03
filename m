From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 22:00:51 +0200
Subject: [Buildroot] [PATCH] vlc: add upstream security patches fixing
	CVE-2017-10699
In-Reply-To: <20170703150140.20387-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 3 Jul 2017 17:01:40 +0200")
References: <20170703150140.20387-1-peter@korsgaard.com>
Message-ID: <87y3s55lzg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > avcodec 2.2.x, as used in VideoLAN VLC media player 2.2.7-x before
 > 2017-06-29, allows out-of-bounds heap memory write due to calling memcpy()
 > with a wrong size, leading to a denial of service (application crash) or
 > possibly code execution.

 > https://trac.videolan.org/vlc/ticket/18467

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
