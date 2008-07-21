From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 21 Jul 2008 15:27:28 +0200
Subject: [Buildroot] lxdoom - only supported if you have an X server?
In-Reply-To: <46a136670807210625u1407699el243983835865607f@mail.gmail.com>
References: <1216644796.21551.8.camel@localhost>
	<46a136670807210625u1407699el243983835865607f@mail.gmail.com>
Message-ID: <1216646848.21551.15.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2008-07-21 at 09:25 -0400, John Voltz wrote:
> As far as I can tell, lxdoom only works with X, there is no DirectFB
> or SDL support in it. I think there is another doom port that does use
> SDL, that was the one you used in your youtube video wasn;'t it? :^)
> 

Okay, could anybody with knowledge of which depend lxdoom should depend
on give a heads up?

I'll send a patch for adding lsdldoom in some minutes, just need to do a
test build.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
