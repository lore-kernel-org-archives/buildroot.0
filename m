From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 22:57:48 +0100
Subject: [Buildroot] [PATCH] mariadb: explicitly disable dtrace detection
In-Reply-To: <1485200837-23626-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Mon, 23 Jan 2017 14:47:17 -0500")
References: <1485200837-23626-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87a8ahjv6r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > By default, mariadb's cmake script tries to detect dtrace support. On
 > hosts that have dtrace installed, this incorrectly enables dtrace and
 > causes compile errors.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
