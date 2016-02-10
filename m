From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2016 07:52:12 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xapp_xf86dga: remove
	dependencies on Xt/Xaw/Xmu
In-Reply-To: <1455055451-19200-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 9 Feb 2016 23:04:11 +0100")
References: <1455055451-19200-1-git-send-email-arnout@mind.be>
Message-ID: <8737t1t5ur.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Since the bump to 1.0.3, xapp_xf86dga no longer uses libXt, libXaw and
 > libXmu. So these dependencies should be removed from the .mk file.

 > They were already removed from Config.in, leading to messages like:
 > Makefile:475: *** xlib_libXaw is in the dependency chain of xapp_xf86dga
 > that has added it to its _DEPENDENCIES variable without selecting it or
 > depending on it from Config.in.  Stop.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed with the autobuilder reference added as suggested by Ricardo, thanks.

-- 
Bye, Peter Korsgaard
