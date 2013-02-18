From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Feb 2013 22:27:26 +0100
Subject: [Buildroot] [PATCH] qt: disable precompiled headers to
	workaround compilation failure
In-Reply-To: <1361216372-13946-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Mon, 18 Feb 2013 20:39:32 +0100")
References: <512282EB.7070702@lucaceresoli.net>
 <1361216372-13946-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87txp9ia81.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Precompiled header implementation is buggy in current Qt as described at
 Luca> http://comments.gmane.org/gmane.comp.lib.qt.devel/5933.

Committed, thanks.

-- 
Bye, Peter Korsgaard
