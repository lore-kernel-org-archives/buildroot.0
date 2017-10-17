From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:10:40 +0200
Subject: [Buildroot] [PATCH] bzip2: fix passing of TARGET_MAKE_ENV to
	make
In-Reply-To: <1507891404-1225-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Fri, 13 Oct 2017 12:43:24 +0200")
References: <1507891404-1225-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87lgkagmwf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > TARGET_MAKE_ENV is not passed to make because it is on a different
 > line without a backslash.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
