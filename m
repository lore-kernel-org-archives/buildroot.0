From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 19:41:01 +0100
Subject: [Buildroot] [PATCH] system/inittab: adjust shutdown
In-Reply-To: <1416502909-5919-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 20 Nov 2014 14:01:49 -0300")
References: <1416502909-5919-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878uj5g1fm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Drop null id since that means "don't show anything" for busybox init,
 > hence the shutdown sequence (/etc/init.d/rcK) doesn't show anything
 > giving the false impression that it's not being run.
 > If someone wants a really silent console they'll need to adjust much more than
 > this anyway.
 > Also swap the root read-only remount with swapoff since the swap can be
 > a regular (loop) file in the root filesystem and make the operation fail
 > resulting in a dirty filesystem.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
