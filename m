From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 May 2017 09:20:32 +0200
Subject: [Buildroot] [PATCH] freetype: add upstream security fixes for
	CVE-2017-8105 and CVE-2017-8287
In-Reply-To: <20170430193602.1577-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 30 Apr 2017 21:36:02 +0200")
References: <20170430193602.1577-1-peter@korsgaard.com>
Message-ID: <87r309f3gf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Add upstream post-2.7.1 commits (except for ChangeLog modifications) fixing
 > the following security issues:

 > CVE-2017-8105 - FreeType 2 before 2017-03-24 has an out-of-bounds write
 > caused by a heap-based buffer overflow related to the
 > t1_decoder_parse_charstrings function in psaux/t1decode.c.

 > CVE-2017-8287 - FreeType 2 before 2017-03-26 has an out-of-bounds write
 > caused by a heap-based buffer overflow related to the
 > t1_builder_close_contour function in psaux/psobjs.c.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
