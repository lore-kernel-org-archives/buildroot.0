From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 15:08:40 +0200
Subject: [Buildroot] [PATCH 01/14] support/scripts/pkg-stats: URL
 checking support
In-Reply-To: <CANQCQpY3MXQHE06QCi+7K+d6fN08azBUik1N9DukBcOaxMRjaQ@mail.gmail.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920225818.51c10322@windsurf>
 <CANQCQpY3MXQHE06QCi+7K+d6fN08azBUik1N9DukBcOaxMRjaQ@mail.gmail.com>
Message-ID: <20180921150840.6ee7c55c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 07:56:46 -0500, Matthew Weber wrote:

> How does this look? (Still some bugs with some of the invalid sites,
> the webservers are reporting incorrect codes....)
> https://pste.eu/p/JpsH.html

Looks good!

> Before adding URL checking, it takes ~2mins.  I was able to keep the
> runtime at 2mins 20sec by pulling in your code for threading and using
> 64 threads.

I think my threading stuff had some issues, which were reported by
Ricardo, and are the reason why my "upstream version checking" stuff
was not merged.

I'd say, let's merge a first version without threading, and we'll see
at adding threading later.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
