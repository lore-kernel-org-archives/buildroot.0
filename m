From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 20:46:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/logrotate: fix legal-info
In-Reply-To: <1560884922-10439-2-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Tue, 18 Jun 2019 21:08:42 +0200")
References: <1560884922-10439-1-git-send-email-pjtexier@koncepto.io>
 <1560884922-10439-2-git-send-email-pjtexier@koncepto.io>
Message-ID: <87o92mn7nw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > Add hash for COPYING file
 > Fixes:

 > $: make logrotate-legal-info
 >>>> logrotate 3.15.0 Collecting legal info
 >  ERROR: No hash found for COPYING

 > Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
