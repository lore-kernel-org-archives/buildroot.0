From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 23:10:28 +0200
Subject: [Buildroot] [PATCH v3 0/5] Runtime testing infrastructure
In-Reply-To: <8b9222c3-8547-fe79-09dc-288553b2a9e2@lucaceresoli.net>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170507220901.4000ec8e@free-electrons.com>
 <8b9222c3-8547-fe79-09dc-288553b2a9e2@lucaceresoli.net>
Message-ID: <20170507231028.3316cffd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 May 2017 22:41:09 +0200, Luca Ceresoli wrote:

> Bad timing on my side: I was reviewing all this work in detail a couple
> of days ago, but my reviews to 2 patches are in my drafts folder waiting
> for the remaining ones... Ok, I'll send them anyway right noe as a list
> of proposed improvements.

Thanks for your review!

> > I know Luca, Ricardo and Thomas DS had some comments, but I believe it
> > would be easier to address them as follow-up patches. So Luca, Ricardo,
> > Thomas, your patches to improve this testing infrastructure are more
> > than welcome. I'm sure it needs to be extended and improved in many
> > different ways to test more Buildroot functionalities.  
> 
> I totally agree this is the best way to proceed. Now everybody can
> easily send small, incremental patches to improve the work. Thanks for
> having applied these patches.

Yes, it will allow everyone to send small, incremental patches, me
included.

> Any plan to have the tests run automatically (on the autobuilders maybe)?

Yes, we will definitely want to do that. I don't think the autobuilders
will do it. Instead I believe running the tests on Gitlab CI would be
easier and more appropriate.

I'm sure Arnout can help :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
