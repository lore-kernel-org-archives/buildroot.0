From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jan 2016 16:19:46 +0100
Subject: [Buildroot] [PATCH] xapp_xbacklight: select xcb-util package
In-Reply-To: <1451918232-11957-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 4 Jan 2016 11:37:12 -0300")
References: <1451918232-11957-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k2npjrsd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > xapp_xbacklight depends on the xcb-utils package but doesn't select it.
 > Fixes:

 > http://autobuild.buildroot.net/results/d96/d96aa77e02954bef6fb6e9d244fbf9d1e939a374/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
