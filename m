From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 10:11:16 +0100
Subject: [Buildroot] [PATCH 5/7] freetype: host-freetype-patch requires
	host-automake
In-Reply-To: <1425028764-1146-6-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Fri, 27 Feb 2015 10:19:22 +0100")
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
 <1425028764-1146-6-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87a8zyz9hn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > The "make host-freetype-patch" fails because using the autogen.sh script
 > it doesn't found the autoconf tool, the problem was already fixed for
 > "make freetype-patch" adding the "host-automake" as a prerequisite to
 > freetype-patch, so fix it by adding "host-automake" as a prerequisite to
 > "host-freetype-patch" too.

Committed with the commit message slightly reworded, thanks.

-- 
Bye, Peter Korsgaard
