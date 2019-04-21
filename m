From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 15:22:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2019-04-14
In-Reply-To: <6290a3e0-ef22-4654-4471-9b6b9a786c2d@dawncrow.de>
References: <701271v3F60UVCn.RZmta@smtpin.rzone.de>
 <6290a3e0-ef22-4654-4471-9b6b9a786c2d@dawncrow.de>
Message-ID: <20190421152221.0665951b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Apr 2019 19:41:57 +0200
Andr? Hentschel <nerv@dawncrow.de> wrote:

> > Results for the 'master' branch
> > ===============================
> > 
> > Build failures related to your packages:
> > 
> >          arm |                 libkrb5-1.16.2 | http://autobuild.buildroot.net/results/41150b7a70ceab08474fa8f1a99486c343f58e21
> >          arc |                 libkrb5-1.16.2 | http://autobuild.buildroot.net/results/a12a53b81d5db4d53fb858a2ad2dd79718cf082e
> >   
> 
> Hi,
> 
> I can't reproduce those and the others here. Guess they are fixed by cb3a0177ef8ac64699d753b11daa0c37b3cf7b88 ?

No, these are fixed by 491b13def5a4dfce21e98becda1f2c6ea99e9fa0, which
I applied just a few hours ago.

> What a waste of time then...

I'm not sure which waste of time you're talking about. All build
failures have a "gitid" file that says with which commit the build was
done, precisely to be able to check if a fix was already done. The
patchwork list of pending patches is also publicly available to check
if someone else has already sent a patch for it.

I'm not sure how we could do better than this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
