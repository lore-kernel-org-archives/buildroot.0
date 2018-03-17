From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Mar 2018 11:43:15 +0100
Subject: [Buildroot] [PATCH] libvorbis: security bump to version 1.3.6
In-Reply-To: <20180316213529.9732-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 16 Mar 2018 22:35:29 +0100")
References: <20180316213529.9732-1-peter@korsgaard.com>
Message-ID: <87vadvf0e4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2018-5146: Prevent out-of-bounds write in codebook decoding.
 > Drop 0001-CVE-2017-14633-Don-t-allow-for-more-than-256-channel.patch and
 > 0002-CVE-2017-14632-vorbis_analysis_header_out-Don-t-clea.patch as they are
 > now upstream, and add a hash for the license file while we're at it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
