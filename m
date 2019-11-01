From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Nov 2019 08:20:52 +0100
Subject: [Buildroot] [PATCH] package/linux-tools: selftests depend on
 !static
In-Reply-To: <20191029204017.10141-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 29 Oct 2019 21:40:17 +0100")
References: <20191029204017.10141-1-arnout@mind.be>
Message-ID: <874kzo2hbf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The indirect dependency through kmod was not tracked.
 > Detected with randconfig.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
