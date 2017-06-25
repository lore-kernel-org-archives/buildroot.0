From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 00:22:51 +0200
Subject: [Buildroot] [PATCH] glmark2: Fix segmentation fault
In-Reply-To: <1497393603-16151-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Tue, 13 Jun 2017 19:40:03 -0300")
References: <1497393603-16151-1-git-send-email-festevam@gmail.com>
Message-ID: <87tw33k8qs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Running glmark2 on imx6 with kernel 4.11.4 and Mesa 17.1.2 leads to
 > a segmentation fault.

 > Apply Lucas Stach's patch to fix the problem while upstream glmark2
 > doesn't get fixed.

 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed to 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
