From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Nov 2012 17:06:29 -0800
Subject: [Buildroot] [PATCH] ocf-linux: tweak kernel patch for newer
	kernels
In-Reply-To: <1354044188-23646-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 27 Nov 2012 16:23:08 -0300")
References: <1354044188-23646-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874nka1qp6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Newer kernels had a slight change in the random number API so the OCF
 Gustavo> patchset requires a slight tweak to build and run properly.

Committed, thanks.

-- 
Bye, Peter Korsgaard
