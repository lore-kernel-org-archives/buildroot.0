From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Feb 2012 12:51:09 +0100
Subject: [Buildroot] [PATCH] DOWNLOAD_WGET: use -O instead of -P to set
	output file
In-Reply-To: <1329213412-29918-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 14 Feb 2012 10:56:52 +0100")
References: <CAM+bi4vAuMsH5=YU6_KAuzF6PVdjE4Ay76hqQzaoHp=Wzb0vvg@mail.gmail.com>
 <1329213412-29918-1-git-send-email-arnout@mind.be>
Message-ID: <871upxws42.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Some URLs use url-encoded arguments to specify the file to download.
 Arnout> Wget will then use an output file name which includes all the ampersands
 Arnout> and such.  However, this is not what we see from buildroot.

 Arnout> E.g.:
 Arnout> FOO_SITE="http://git.foo.com/?p=foo.git;a=blob;f="
 Arnout> FOO_SOURCE="foo.tgz"

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
