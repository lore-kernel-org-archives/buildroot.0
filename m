From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 May 2017 21:35:49 +0200
Subject: [Buildroot] [PATCH 2/2] picocom: force target LDFLAGS
In-Reply-To: <87d1bpd9iu.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 03 May 2017 21:29:13 +0200")
References: <04e1e4d95a425dfc0e0650088cb0120a9f3e46a8.1493815595.git.baruch@tkos.co.il>
 <f7abac9c0ca017bffd3109f7df0d6bfa7f099281.1493815595.git.baruch@tkos.co.il>
 <87h912c67z.fsf@dell.be.48ers.dk>
 <20170503170019.tzz5ok3gwkq67v5z@tarshish>
 <87d1bpd9iu.fsf@dell.be.48ers.dk>
Message-ID: <87inlfrt9m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
 > Hi,

 >>> Committed, thanks.
 >>> 
 >>> Is this only an issue for picocom 2.2, or also something we should
 >>> backport for the 2017.02.x branch?

 >> Version 2.1 is also affected. But I'm not sure the issue is bad enough for a 
 >> backport.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
