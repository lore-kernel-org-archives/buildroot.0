From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Jun 2021 08:35:47 +0200
Subject: [Buildroot] [PATCH/stable] package/putty: Ignore CVE-2021-33500
In-Reply-To: <20210608050921.tm7q7miatnfyy3v7@falbala.internal.home.lespocky.de>
 (Alexander Dahl's message of "Tue, 8 Jun 2021 07:09:22 +0200")
References: <20210601070316.27441-1-post@lespocky.de>
 <20210608050921.tm7q7miatnfyy3v7@falbala.internal.home.lespocky.de>
Message-ID: <87y2bksw1o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:

 > Hello everyone,
 > since I get autobuilder warning mails every Monday for CVE-2021-33500
 > now, I kindly wanted to ask, if this is the right approach?

 > That CVE only affects Windows, master has putty 0.75 which has that
 > fixed already. So I thought it would not be necessary to backport 0.75
 > to the stable branch(es), but ignore that CVE in stable branches only?

Yes, that is fine. Sorry, I am running a bit behind on the LTS
backports, but I will get to it this week.

Thanks.

-- 
Bye, Peter Korsgaard
