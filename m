From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jun 2016 21:09:35 +0200
Subject: [Buildroot] [PATCH] busybox: disable nsenter/unshare in default
	config
In-Reply-To: <1466637199-16264-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 22 Jun 2016 20:13:19 -0300")
References: <1466637199-16264-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87inwzvi1c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > These require newer toolchain components. Since they didn't exist in
 > previous versions no functionality is lost. Fixes:
 > http://autobuild.buildroot.net/results/b63/b6312626b3938555c4e5a68ad42f6951b02d7760/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
