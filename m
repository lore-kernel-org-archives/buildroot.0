From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 22:38:59 +0100
Subject: [Buildroot] [PATCH] system/permissions: /etc/random-seed must
	be mode 600
In-Reply-To: <1416517694-7952-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 20 Nov 2014 18:08:14 -0300")
References: <1416517694-7952-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mw7fq7t8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Otherwise it's a big security risk.
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

While I think we should rework the random-seed handling, that will be
post-2014.11 - So committed, thanks.

-- 
Bye, Peter Korsgaard
