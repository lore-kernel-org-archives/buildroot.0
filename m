From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 10:47:54 +0100
Subject: [Buildroot] [PATCH] glibc: add security patches
In-Reply-To: <1455665506-17709-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 16 Feb 2016 20:31:46 -0300")
References: <1455665506-17709-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vb5n1xdh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fix for 2.21 and 2.22:
 > CVE-2015-7547 - glibc getaddrinfo stack-based buffer overflow.

 > For 2.21:
 > CVE-2014-8121 - Unexpected closing of nss_files databases after lookups
 > causes denial of service.
 > CVE-2015-1781 - buffer overflow in gethostbyname_r() and related
 > functions with misaligned buffer.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
