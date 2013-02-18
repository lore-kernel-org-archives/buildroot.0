From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Feb 2013 13:07:35 +0100
Subject: [Buildroot] [PATCH] ntfs-3g: needs mmu
In-Reply-To: <1361187457-8689-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 18 Feb 2013 08:37:37 -0300")
References: <1361187457-8689-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ehgdlta0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The internal libfuse-lite implementation uses it, and since
 Gustavo> the external full-blown libfuse also requires it there's no
 Gustavo> other choice.

Committed, thanks.

-- 
Bye, Peter Korsgaard
