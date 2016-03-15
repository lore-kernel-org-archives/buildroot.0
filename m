From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:16:47 +0100
Subject: [Buildroot] [V3 2/2] scancpan: use recommend & test flags only
	at first level
In-Reply-To: <1457890649-4838-2-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Sun, 13 Mar 2016 18:37:29 +0100")
References: <1457890649-4838-1-git-send-email-francois.perrad@gadz.org>
 <1457890649-4838-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <874mc775f4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Currently, these flags are recursively propagated. This behavior is
 > not expected by users, because it can cause dependencies explosively.

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
