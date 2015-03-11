From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 17:21:29 +0100
Subject: [Buildroot] [PATCH] graph-depends: remove absent targets from
	TARGET_EXCEPTIONS
In-Reply-To: <1426060397-4458-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Wed, 11 Mar 2015 10:53:17 +0300")
References: <1426060397-4458-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87bnjzmrna.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Most of targets listed in TARGET_EXCEPTIONS these days are long
 > gone, so why still keep them?

 > Most of those targets were removed in this commit:
 > http://git.buildroot.net/buildroot/commit/?id=02b88600312554bf166f6cfd71f7f2ede783096a

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <jacmet@sunsite.dk>

Committed, thanks.

-- 
Bye, Peter Korsgaard
