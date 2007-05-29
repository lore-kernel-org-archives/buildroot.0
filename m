From: Peter Korsgaard <peter.korsgaard@barco.com>
Date: Tue, 29 May 2007 16:55:54 +0200
Subject: [Buildroot] bug for libid3tag Config.in
In-Reply-To: <002301c7a1fe$b4645d70$016efea9@SDW> (Stuart Wood's message of
	"Tue, 29 May 2007 10:36:12 -0400")
References: <002301c7a1fe$b4645d70$016efea9@SDW>
Message-ID: <87hcpvn0g5.fsf@sleipner.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "SW" == Stuart Wood <stuart.wood@labxtechnologies.com> writes:

SW> I believe that the libid3tag Config.in needs select
SW> BR2_PACKAGE_ZLIB

Ah yes. Fixed in r18700.

-- 
Bye, Peter Korsgaard
