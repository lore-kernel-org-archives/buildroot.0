From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Feb 2009 10:22:34 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <49A268F5.5030300@carallon.com> (Will Wagner's message of "Mon\,
	23 Feb 2009 09\:14\:29 +0000")
References: <20090222224350.GG5893@buzzloop.caiaq.de>
	<49A268F5.5030300@carallon.com>
Message-ID: <87y6vx33tx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

Hi,

 Will> Not sure if this is the same as a problem I was seeing with
 Will> alsa-lib. It was a while ago so not entirely sure. However I found my
 Will> problem was to do with the complicated alsa versioning API meaning
 Will> that the wrong version of the function was called. I fixed it by
 Will> adding --with-versioned="no" to the alsa-lib configure (I also moved
 Will> to 1.0.19 as that had a number of bug fixes for other things I
 Will> needed).

 Will> Hope that helps,

Care to send a patch for both?

-- 
Bye, Peter Korsgaard
