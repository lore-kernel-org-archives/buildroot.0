From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 22:31:55 +0100
Subject: [Buildroot] [PATCH] zeromq: security bump to version 4.0.5
In-Reply-To: <1415737755-17287-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 11 Nov 2014 17:29:15 -0300")
References: <1415737755-17287-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mu5mnjo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-7202 - stream_engine.cpp in libzmq (aka ZeroMQ/C++)) 4.0.5
 > before 4.0.5 allows man-in-the-middle attackers to conduct downgrade
 > attacks via a crafted connection request.
 > CVE-2014-7203 - libzmq (aka ZeroMQ/C++) 4.0.x before 4.0.5 does not
 > ensure that nonces are unique, which allows man-in-the-middle attackers
 > to conduct replay attacks via unspecified vectors.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
