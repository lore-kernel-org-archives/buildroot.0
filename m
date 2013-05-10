From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 May 2013 20:37:55 +0200
Subject: [Buildroot] [PATCH] hplip: needs threads
In-Reply-To: <1368180880-9843-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 10 May 2013 07:14:40 -0300")
References: <1368180880-9843-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871u9e4r5o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Hplip needs threads because libusb needs them. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/12fb9bb8c93c1cc1f93ba8e15558d1630f2e7c3d/

Committed, thanks.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

-- 
Bye, Peter Korsgaard
