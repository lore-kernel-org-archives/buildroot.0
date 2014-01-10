From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Jan 2014 15:43:03 +0100
Subject: [Buildroot] [PATCH] openssl: fix bug #6770
In-Reply-To: <1389309614-17911-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 9 Jan 2014 20:20:14 -0300")
References: <1389309614-17911-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vbxr7v9k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > openssl 1.0.1f Makefile.org doesn't quote $(CC) when passing the
 > parameter in another invocation of make, hence breaking when the
 > compiler string contains a space with multiple strings (for example with
 > ccache).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
