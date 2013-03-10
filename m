From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 22:22:31 +0100
Subject: [Buildroot] [PATCH v2 4/8] gptfdisk: use TARGET_CONFIGURE_OPTS
	properly, use TARGET_MAKE_ENV
In-Reply-To: <1362689131-1479-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 21:45:26 +0100")
References: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362689131-1479-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87hakjx84o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> $(TARGET_CONFIGURE_OPTS) should be passed as $(MAKE) argument, not in
 Thomas> the environment. We can then remove the redefined CC and LD variables
 Thomas> that were useless. We also take this opportunity to pass
 Thomas> $(TARGET_MAKE_ENV) in the environment of make.

Committed, thanks.

-- 
Bye, Peter Korsgaard
