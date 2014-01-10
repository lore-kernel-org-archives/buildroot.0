From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Jan 2014 15:35:50 +0100
Subject: [Buildroot] [PATCH 4/5] system: default to empty issue/hostname
	for custom skeleton
In-Reply-To: <7760A17EBB28454BB3DB504F6FC2E45C@JohanW7> (Sagaert Johan's
 message of "Fri, 10 Jan 2014 09:52:23 +0100")
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <cffd411631d99ddd729f0e29888b0fb14941889a.1389134731.git.yann.morin.1998@free.fr>
 <87r48gaoc0.fsf@dell.be.48ers.dk> <20140109204458.GE3713@free.fr>
 <7760A17EBB28454BB3DB504F6FC2E45C@JohanW7>
Message-ID: <87zjn37vll.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 > Hi All;

 > I made this patch because I found it made more sense if I selected a
 > custom skeleton that in that case buildroot should not insert its own
 > hostname, issue,TZ etc into the target root directory.  If I can
 > achieve the same result by leaving the hostname etc... empty in
 > buildroot menu then this is fine.  I just wanted buildroot not to
 > overwrite anything when I selected a custom skeleton.

Ok, thanks. Then I'll just take the part of the patch that updates the
documention.

-- 
Bye, Peter Korsgaard
