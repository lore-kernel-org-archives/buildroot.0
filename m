From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Dec 2014 12:31:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/freerdp: do not use Neon
	extensions when not available
In-Reply-To: <dc7aed907743824f29e6000e45e01388ae8cf0dd.1419704115.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 27 Dec 2014 19:16:06 +0100")
References: <cover.1419704115.git.yann.morin.1998@free.fr>
 <dc7aed907743824f29e6000e45e01388ae8cf0dd.1419704115.git.yann.morin.1998@free.fr>
Message-ID: <8761cwdn90.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > FreeRDP mis-detects the CPU, and may enable Neon extensions when it
 > should not. Not all ARM processors have Neon extensions.

 > Heck, what's more, none non-ARM processor has Neon extensions!
 > The regexp to detect the CPU is borked:  'arm*'  will also match 'arc'
 > as well as 'arm'.

Huh, how does arm* march arc?

-- 
Bye, Peter Korsgaard
