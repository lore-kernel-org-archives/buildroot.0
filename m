From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 21:44:55 +0200
Subject: [Buildroot] [PATCH] libpjsip: disable parallel build
In-Reply-To: <574833E0.8020709@lucaceresoli.net>
References: <1463057293-2833-1-git-send-email-luca@lucaceresoli.net>
 <20160512155024.7fe37f68@free-electrons.com>
 <574833E0.8020709@lucaceresoli.net>
Message-ID: <20160527214455.2b44c037@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 May 2016 13:47:44 +0200, Luca Ceresoli wrote:

> > So, applied to master! Please monitor the autobuilders in the next
> > hours/days to see if the issue is resolved or not.  
> 
> It's 15 days since this patch has been applied, and we had no more
> autobuild failures on libpjsip-2.4.5 after that.

Yes, I also haven't seen any libpjsip failure since quite some time.

> The time frame between the previous patch to libpjsip (9db9a6d2b3c595)
> and this one lasted ~45 days and produced 13 autobuild failures.
> 
> I'm starting being moderately optimistic about having solved the
> problem. I'll wait a few more days, then unless we see new failures I'll
> report to the upstream mailing list.

I agree that disabling parallel build seems to have fixed the problem,
so you can report the issue upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
