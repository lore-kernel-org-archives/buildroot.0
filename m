From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 10:19:01 +0100
Subject: [Buildroot] [PATCH 1/3] xenomai: bump version to 3.0.3
In-Reply-To: <7f8f513c-d847-5b70-c084-6538c3a6af43@mind.be>
References: <20170320233349.14057-1-sikor6@gmail.com>
 <20170320234014.6ad3182f@free-electrons.com>
 <7f8f513c-d847-5b70-c084-6538c3a6af43@mind.be>
Message-ID: <20170321101901.1bfbc40e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 09:57:35 +0100, Arnout Vandecappelle wrote:

> > My understanding was that Xenomai 3.x was significantly different from
> > Xenomai 2.x. Should we support both versions? Is Xenomai 3.x now old
> > enough that Xenomai 2.x is considered legacy? What problems will people
> > currently using Xenomai 2.x face if we ask them to move to Xenomai 3.x?  
> 
>  There are some API differences, but (at least in dual-kernel mode), it is
> pretty easy to port over. I think we have lots of packages where version bumps
> introduce slight behavioural changes so I think this is OK.

OK, thanks. As long as it doesn't require people having Xenomai
applications to do a full rewrite, then I'm fine with a bump to 3.X as
opposed to supporting both 2.x and 3.x. Minor adaptations are OK, just
like is often needed when upgrading libraries, as you said.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
