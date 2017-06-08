From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Jun 2017 16:47:16 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix shebang with bash
In-Reply-To: <20170605073740.855-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Mon, 5 Jun 2017 09:37:40 +0200")
References: <20170605073740.855-1-francois.perrad@gadz.org>
Message-ID: <87y3t2a64r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Out of interest, what distribution doesn't have bash in /bin?
#!/bin/bash is a quite common shebang, and we use it in several places
outside support/scripts.

-- 
Bye, Peter Korsgaard
