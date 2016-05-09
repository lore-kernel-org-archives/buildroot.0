From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 14:53:09 +0200
Subject: [Buildroot] [PATCH 01/34] reproducibility: introduce config knob
In-Reply-To: <878tzjn0du.fsf@dell.be.48ers.dk>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <878tzjn0du.fsf@dell.be.48ers.dk>
Message-ID: <20160509145309.1ae28c04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 09 May 2016 09:42:05 +0200, Peter Korsgaard wrote:

> Hmm, I'm not sure I like the extra complexity of 2 ways of doing
> things. What are the use cases for these timestamps? Are they important
> enough to keep?

I use timestamps all the time to verify that I'm indeed running the
version of the code I intend to run. As I work on the kernel, I use the
kernel timestamp, but I really use it all the time, to double check
that I'm running the kernel image I just built and not one that was
left around, built several days/weeks ago.

So timestamps are useful IMO.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
