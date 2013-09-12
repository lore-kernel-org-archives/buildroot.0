From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 09:23:58 +0200
Subject: [Buildroot] [PATCH v2 3/7] mesa3d: pull out from x11
In-Reply-To: <CAEBucnB6NJGS=5WoiwieasauipypqSX5phq-Xp_GGSiALM3dnA@mail.gmail.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-4-git-send-email-spenser@gillilanding.com>
 <20130908190231.70e667fa@skate>
 <CAEBucnB6NJGS=5WoiwieasauipypqSX5phq-Xp_GGSiALM3dnA@mail.gmail.com>
Message-ID: <20130912092358.0f0db2ec@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed, 11 Sep 2013 21:57:21 -0500, Spenser Gilliland wrote:

> > Bottom-line: I believe it's too early to move mesa3d outside of
> > package/x11r7/. Let's keep it in there for now, merge your current
> > patches, and work on that as a followup step.
> 
> I'll add the move of pthread stubs (and any other required X libs) to
> this patch set.

Great, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
