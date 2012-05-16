From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 May 2012 15:30:05 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: explicitly disable libnl by
	default
In-Reply-To: <1337162878-28425-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 16 May 2012 07:07:58 -0300")
References: <1337162878-28425-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r4ukp82q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> libnl support is enabled by default since version 1.0, so disable it
 Gustavo> to avoid build breakage when there's no libnl.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
