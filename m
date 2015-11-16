From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 21:52:21 +0100
Subject: [Buildroot] [PATCH] boost: fix sparc compile
In-Reply-To: <564A3FF4.2030707@mind.be>
References: <20151115122455.GA29481@waldemar-brodkorb.de>
 <20151116214000.3f33b341@free-electrons.com>
 <564A3FF4.2030707@mind.be>
Message-ID: <20151116215221.3b61ff3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, 16 Nov 2015 21:43:32 +0100, Arnout Vandecappelle wrote:

> boost::context still does not compile. Don't know why it is
> disabled for sparc/sparc64 as it contains the needed code.
> Need to check on my sparc systems before enabling via a patch.

Indeed.

>  But for the release we probably want to disable it in Config.in.

Done:
http://git.buildroot.net/buildroot/commit/?id=648956a137949e0388536688fff3ae4f7bb298a8.
sparc64 was already not allowed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
