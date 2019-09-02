From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 13:47:23 +0200
Subject: [Buildroot] [PATCH] package/mpg123: security bump to version
 1.25.12
In-Reply-To: <20190825064738.7957-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 25 Aug 2019 08:47:37 +0200")
References: <20190825064738.7957-1-peter@korsgaard.com>
Message-ID: <87woeqyl6c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the release notes:
 > - Fix an out-of-bounds read of maximal two bytes for truncated RVA2 frames
 >   (oss-fuzz-bug 15975). The earlier fix around the same location needed
 >   one thought more. Actually, another though was needed, oss-fuzz-bug 16009
 >   documents the incomplete fix.

 > - Fix an invalid write of one zero byte for empty ID3v2 frames that demand
 >   de-unsyncing (oss-fuzz-bug 16050).

 > - Fix dynamic build with gcc -fsanitize=address (check for all dl functions
 >   before deciding that separate -ldl is not needed).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
