From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Apr 2009 10:55:57 +0200
Subject: [Buildroot] additional patches post or pre ?
In-Reply-To: <E2221E2DA68F4F06BB0943182B42C497@apexjs> (Sagaert Johan's
	message of "Tue\, 21 Apr 2009 00\:18\:42 +0200")
References: <E2221E2DA68F4F06BB0943182B42C497@apexjs>
Message-ID: <87d4b5oyn6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> How are the additional paches from DL_DIR applied ?
 Sagaert> before or after the other patches ?

Ehh, what patches? We don't have any special handling of extra
patches. A few packages download their patches (like vim) instead of
having them under package/<package>, but they get applied just like
the other packages.

-- 
Bye, Peter Korsgaard
