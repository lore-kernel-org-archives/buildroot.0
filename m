From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2016 11:17:40 +0200
Subject: [Buildroot] [PATCH] build: fix umask test
In-Reply-To: <87inxw2cnt.fsf@dell.be.48ers.dk>
References: <20160530070635.GA27560@airbook.vandijck-laurijssen.be>
 <87mvn82d50.fsf@dell.be.48ers.dk> <87inxw2cnt.fsf@dell.be.48ers.dk>
Message-ID: <20160530111740.14c24236@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 May 2016 10:05:58 +0200, Peter Korsgaard wrote:

> Sorry, I misremembered. This logic is above the line where we assign
> bash to SHELL, so it runs with /bin/sh as shell. On my system, this is
> dash and it behaves like bash in this regard. What shell do you use?

From the Kurt's previous e-mails, I believe he is using mksh as his
shell.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
