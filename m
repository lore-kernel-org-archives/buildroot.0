From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jun 2019 13:30:53 +0200
Subject: [Buildroot] [PATCH 2/2] package/haveged: fix legal-info
In-Reply-To: <1560974743-20081-2-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Wed, 19 Jun 2019 22:05:43 +0200")
References: <1560974743-20081-1-git-send-email-pjtexier@koncepto.io>
 <1560974743-20081-2-git-send-email-pjtexier@koncepto.io>
Message-ID: <87wohg8pea.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > Add hash for COPYING file
 > Fixes:

 > $: make haveged-legal-info
 >>>> haveged 1.9.4 Collecting legal info
 >  ERROR: No hash found for COPYING

 > Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Committed, thanks.

-- 
Bye, Peter Korsgaard
