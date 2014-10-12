From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 18:28:09 +0200
Subject: [Buildroot] [PATCH 1/1] beaglebone: better support for starting
	and creating images
In-Reply-To: <543A5A3A.2070605@mind.be> (Arnout Vandecappelle's message of
 "Sun, 12 Oct 2014 12:38:50 +0200")
References: <1394799202-15980-1-git-send-email-marcin.jabrzyk@gmail.com>
 <543A5A3A.2070605@mind.be>
Message-ID: <87vbnpuuau.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 14/03/14 13:13, Marcin Jabrzyk wrote:
 >> - Added short readme file with description of first steps how to start.
 >> - Added uEnv.txt so the board can start from SDCard
 >> - Added post-image.sh script to copy included uEnv.txt to output/images
 >> 
 >> Signed-off-by: Marcin Jabrzyk <marcin.jabrzyk@gmail.com>

 > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 >  I didn't actually test it in any way, but it looks good and Stephan tested it.

Agreed - Committed, thanks.

-- 
Bye, Peter Korsgaard
