From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Oct 2012 22:26:09 +0200
Subject: [Buildroot] [PATCH] Disable database support in linux-pam
In-Reply-To: <1347442051-24329-1-git-send-email-golubovsky@gmail.com>
 (Dmitry's message of "Wed, 12 Sep 2012 05:27:31 -0400")
References: <1347442051-24329-1-git-send-email-golubovsky@gmail.com>
Message-ID: <87hapy15lq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dmitry" == Dmitry  <golubovsky@gmail.com> writes:

 Dmitry> Due to the conflicts with default Berkeley DB configuration, disable
 Dmitry> database support in linux-pam: pam_userdb is not built.

Committed, thanks.

-- 
Bye, Peter Korsgaard
