From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 22:30:43 +0100
Subject: [Buildroot] [PATCH] boot/grub: add rootwait to default config
In-Reply-To: <1457642787-28168-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 10 Mar 2016 17:46:27 -0300")
References: <1457642787-28168-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k2lakol8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It doesn't hurt, and is useful for removable boot media like a pendrive
 > that may depend on usb enumeration and isn't available immediately.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
