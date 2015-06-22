From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2015 00:19:58 +0200
Subject: [Buildroot] [PATCH 4/6] gcc: switch to gcc 4.9 as the default
	version
In-Reply-To: <1434292411-5003-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 14 Jun 2015 16:33:29 +0200")
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1434292411-5003-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87twtz75dd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Now that we have added gcc 5.1, it's time to make gcc 4.9 the default
 > version used in Buildroot.

Committed, thanks.

 > Should we deprecate/remove gcc 4.7 ? Maybe it's a bit early, I don't
 > know.

I think it's a bit too early, I'm still stuck on 4.7.x for a project at
work atleast.

-- 
Bye, Peter Korsgaard
