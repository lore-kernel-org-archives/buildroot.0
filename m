From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Oct 2015 23:44:01 +0200
Subject: [Buildroot] [PATCH] iproute2: drop dead tipc disabling code
In-Reply-To: <1445530827-31937-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 22 Oct 2015 13:20:27 -0300")
References: <1445530827-31937-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87eggmk28u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Since it's automatic via libmnl being present it's just dead code that's
 > not defined any longer, so remove it.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
