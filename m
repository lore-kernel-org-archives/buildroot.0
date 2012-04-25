From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 25 Apr 2012 14:24:48 +0000 (UTC)
Subject: [Buildroot] uemacs doesn't clear ixon termios flag?
Message-ID: <jn91fg$mt2$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've enabled the uemacs package. It builds fine, but it doesn't seem
to work unless you manually clear the termios ixon flag before running
it.  If you don't do that, the Ctrl-S keystroke isn't seen by uemacs
-- instead it's intercepted by the tty layer and stops terminal
output until you hit Ctrl-Q.

Has anybody else noticed this?

-- 
Grant Edwards               grant.b.edwards        Yow! My BIOLOGICAL ALARM
                                  at               CLOCK just went off ... It
                              gmail.com            has noiseless DOZE FUNCTION
                                                   and full kitchen!!
