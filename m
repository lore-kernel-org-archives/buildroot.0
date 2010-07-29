From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jul 2010 14:26:31 +0200
Subject: [Buildroot] [PATCH] netsnmp should depend on openssl when using
	it
In-Reply-To: <4C5170D5.7050305@zacarias.com.ar> (Gustavo Zacarias's message of
	"Thu, 29 Jul 2010 09:15:17 -0300")
References: <4C5170D5.7050305@zacarias.com.ar>
Message-ID: <87k4oeeao8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The netsnmp package should depend on openssl when using it.
 Gustavo> Otherwise netsnmp might get built before openssl and poison the
 Gustavo> configure cache since it's not a mandatory dependency.

Committed, thanks.

-- 
Bye, Peter Korsgaard
