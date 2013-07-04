From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Jul 2013 13:31:04 +0200
Subject: [Buildroot] [PATCH] linux-headers: switch to xz format
In-Reply-To: <1372935038-28722-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 4 Jul 2013 07:50:38 -0300")
References: <1372935038-28722-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ehbelfye.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The headers and kernels where changed to XZ format on commit
 Gustavo> 98b5cc3eb4d4103b2149325b98a5e93e68c68dd8, but the headers reverted back
 Gustavo> to bz2 on the packaging of the toolchain.
 Gustavo> This causes double kernel downloads when the versions match, so switch
 Gustavo> back the headers to XZ.

Committed, thanks.

-- 
Bye, Peter Korsgaard
