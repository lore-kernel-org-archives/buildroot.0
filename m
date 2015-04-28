From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Apr 2015 21:23:36 +0200
Subject: [Buildroot] [PATCH] qt: QT_COORD_TYPE_DOUBLE should only be set
	on soft float
In-Reply-To: <1430235747-5775-1-git-send-email-richard.genoud@gmail.com>
 (Richard Genoud's message of "Tue, 28 Apr 2015 17:42:27 +0200")
References: <874mo0zj0r.fsf@dell.be.48ers.dk>
 <1430235747-5775-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <87zj5sxdjb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard Genoud <richard.genoud@gmail.com> writes:

 > If QT_COORD_TYPE_DOUBLE is forced and hard float is used, Qt compilation
 > breaks because it can't find hard coded operations on double.

 > Moreover, QT_COORD_TYPE is float only if QT_NO_FPU is set.
 > (cf src/corelib/global/qglobal.h)

 > So, we can safely make the QT_COORD_TYPE_DOUBLE option depend on
 > BR2_SOFT_FLOAT.

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
