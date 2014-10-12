From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 12:50:24 +0200
Subject: [Buildroot] [PATCH 2/5] zsh: security bump to version 5.0.7
In-Reply-To: <1412774389-11297-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 8 Oct 2014 10:19:46 -0300")
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
 <1412774389-11297-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mw91zhn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes shellshock-alike exploits.
 > Add /bin/sh -> zsh symlink, install binary to /bin as all shells should
 > be, add hash file and build after busybox.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed with the /bin/sh handling removed as we'll handle it globally
instead, thanks.

-- 
Bye, Peter Korsgaard
