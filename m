From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Apr 2013 09:43:15 +0200
Subject: [Buildroot] [PATCH] openvpn: adjust iproute2 logic
In-Reply-To: <515DF1AC.8060506@zacarias.com.ar> (Gustavo Zacarias's message of
 "Thu, 04 Apr 2013 18:33:32 -0300")
References: <1365094499-21046-1-git-send-email-gustavo@zacarias.com.ar>
 <878v4y3tp2.fsf@dell.be.48ers.dk> <515DF1AC.8060506@zacarias.com.ar>
Message-ID: <87zjxa3hws.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 >> Could you invert the logic so you explicitly check for the old busybox
 >> versions instead?

 Gustavo> True.

 Gustavo> We'll likely forget to remove dead code too later on, but it
 Gustavo> doesn't hurt :) Regards.

Indeed, that's a lot less harmful.

-- 
Bye, Peter Korsgaard
