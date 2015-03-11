From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 17:11:38 +0100
Subject: [Buildroot] [PATCH] busybox: remove actions that depend on
	removed netkit* packages
In-Reply-To: <1426061471-8321-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Wed, 11 Mar 2015 11:11:11 +0300")
References: <1426061471-8321-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87fv9bms3p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Both "netkitbase" and "netkittelnet"  packages were removed by this
 > commit:
 > http://git.buildroot.net/buildroot/commit/?id=560fe85bf7fb81956e80848c8bb28d7a6d00a2a2

 > Now we may safely remove reminders in busybox.mk that depend on
 > mentioned packages that are no longer in Buildroot.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
