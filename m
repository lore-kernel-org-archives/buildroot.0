From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 17:03:57 +0200
Subject: [Buildroot] [PATCH] minnowboard-max: Start X on boot and run a
	few demos
In-Reply-To: <20160704145229.23995-1-ezequiel@vanguardiasur.com.ar> (Ezequiel
 Garcia's message of "Mon, 4 Jul 2016 11:52:29 -0300")
References: <20160704145229.23995-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <87inwle97m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > Now that we've merged nodm, the autologin display manager, we can
 > get rid of xinit, and startx hack and use nodm to start X on boot.
 > While here, let's start xterm and glmark2, just as demos.

 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > ---
 > I've chosen the demo apps somewhat arbitrarily:
 >  * xterm because everyone loves terminals
 >  * glmark2 to test OpenGL

Committed, thanks.

-- 
Bye, Peter Korsgaard
