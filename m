From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 22:43:58 +0100
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: remove
	HOSTCC_VERSION
In-Reply-To: <1448147919-5463-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 22 Nov 2015 00:18:37 +0100")
References: <1448147919-5463-1-git-send-email-arnout@mind.be>
Message-ID: <87fuzx676p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > HOSTCC_VERSION is no longer used since gcc switched to the package
 > infrastructure in e236fe481. It was in fact no longer needed since we
 > dropped support for gcc 4.3.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > Note that we currently claim to support system gcc >= 2.95, but I don't
 > think that matches reality...

Ehh, no. I guess a 4.x version would make more sense. Any idea what 'x'
should be? 3? 5? 7?

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
