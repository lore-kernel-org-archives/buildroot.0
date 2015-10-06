From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Oct 2015 11:48:44 +0200
Subject: [Buildroot] [PATCH] gdk-pixbuf: security bump to version 2.32.1
In-Reply-To: <1444074756-30032-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 5 Oct 2015 16:52:36 -0300")
References: <1444074756-30032-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d1wsfhtv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > CVE-2015-4491 already fixed in the release so drop patch.
 > Fixes a heap overflow with a gif file and a heap overflow and DoS with a
 > tga file. CVEs not assigned yet.

 > Tests disabled since they fail to build properly on uClibc toolchains.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
