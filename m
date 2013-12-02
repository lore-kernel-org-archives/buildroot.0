From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Dec 2013 13:33:13 +0100
Subject: [Buildroot] [PATCH] libtasn1: fix botched makeinfo/missing logic
In-Reply-To: <1385986977-12085-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 2 Dec 2013 09:22:57 -0300")
References: <1385986977-12085-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874n6rqvp2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The makeinfo/missing logic is botched leading to failures such as:
 > http://autobuild.buildroot.net/results/5f0/5f0e8f62be86b56813f5fc0510e83289ed2b0410/
 > Just disable documentation build the hard way.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
