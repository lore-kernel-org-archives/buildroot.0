From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 09:08:33 +0100
Subject: [Buildroot] [PATCH 3/5] util-linux: add agetty->getty symlink
In-Reply-To: <1385981368-2235-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 2 Dec 2013 07:49:26 -0300")
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
 <1385981368-2235-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mwkipda6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > When busybox isn't installed symlink agetty->getty to make the default
 > inittab work.

Committed, thanks.

-- 
Bye, Peter Korsgaard
