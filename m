From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Oct 2017 08:15:34 +0200
Subject: [Buildroot] [PATCH] qt: Allow enabling of QtWebKit with GCC 6+
In-Reply-To: <4881796E12491D4BB15146FE0209CE6467F9F640@DE02WEMBXB.internal.synopsys.com>
 (Alexey Brodkin's message of "Tue, 17 Oct 2017 15:02:39 +0000")
References: <20170922125003.32618-1-didin@synopsys.com>
 <87d15mkv01.fsf@dell.be.48ers.dk>
 <4881796E12491D4BB15146FE0209CE6467F9F640@DE02WEMBXB.internal.synopsys.com>
Message-ID: <87r2tt5awp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

Hi,

 >> Committed to 2017.08.x, thanks.

 > I see that commit was applied on 2 "LTS" branches already which is definitely good.
 > But my question is are there any formal rules and guidelines for patches to be
 > cherry-picked onto LTS branches? Something like
 > https://github.com/torvalds/linux/blob/master/Documentation/process/stable-kernel-rules.rst?

As discussed during the dev days, we don't really have any format
rules. If you think specific patches should be backported, please let me
know.

-- 
Bye, Peter Korsgaard
