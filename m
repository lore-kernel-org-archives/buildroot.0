From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Apr 2015 00:01:58 +0200
Subject: [Buildroot] [PATCH 1/1 v2] build host lz4 to support lz4
 compression in the kernel.
In-Reply-To: <551C6935.3050401@mind.be>
References: <1427919153-16080-1-git-send-email-sagaert.johan@proximus.be>
 <20150401223752.0fd358cf@free-electrons.com>
 <551C6935.3050401@mind.be>
Message-ID: <20150402000158.0b85c847@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 01 Apr 2015 23:55:01 +0200, Arnout Vandecappelle wrote:

>  Well, I'm in agreement with Johan's earlier statement that the overhead of the
> host-lz4 build is negligible. It takes 20 seconds on my laptop, of which 6 are
> buildroot overhead from parsing package/*/*.mk.

20 seconds, plus the host-lzop build time that we already build
unconditionally.

>  Peter said before that all this hacking of linux (or other) config files should
> be avoided, and I agree.

Correct, except when it's related to needed dependencies in Buildroot.

But if that's fine for everyone, I'm OK with merging an unconditional
host-lz4 dependency. I'll just follow what the consensus is on this
matter, since I don't feel like arguing too much on this
not-so-important issue.

Thanks for the feedback, definitely very useful to have the opinion of
others to help take a decision.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
