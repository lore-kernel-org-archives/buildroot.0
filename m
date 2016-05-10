From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 May 2016 21:45:07 +0200
Subject: [Buildroot] [PATCH] imagemagick: security bump to version
	6.9.4-1
In-Reply-To: <1462904746-23217-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 10 May 2016 15:25:46 -0300")
References: <1462904746-23217-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8760ullmt8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > Fix GetNextToken() off by one error.
 > Check for buffer overflow in magick/draw.c/DrawStrokePolygon().
 > Remove support for internal ephemeral coder.

 > These are all related to the recent ImageTragick bundle that were
 > partially fixed in 6.9.3-10 as well.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
