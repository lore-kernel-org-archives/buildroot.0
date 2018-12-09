From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 22:25:43 +0100
Subject: [Buildroot] [PATCH v3 6/9] package/libpjsip: add Asterisk patch
 set
In-Reply-To: <20181014144646.3ad2f867@windsurf>
References: <20181014090202.31122-1-bernd.kuhls@t-online.de>
 <20181014090202.31122-6-bernd.kuhls@t-online.de>
 <20181014144646.3ad2f867@windsurf>
Message-ID: <20181209222543.5af4a94b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun, 14 Oct 2018 14:46:46 +0200, Thomas Petazzoni wrote:

> On Sun, 14 Oct 2018 11:01:58 +0200, Bernd Kuhls wrote:
> > Quoting https://wiki.asterisk.org/wiki/display/AST/PJSIP-pjproject
> > 
> > "Asterisk currently contains two SIP stacks: the original chan_sip SIP
> >  channel driver which is a complete standalone implementation, has been
> >  present in all previous releases of Asterisk and no longer receives
> >  core support, and the newer chan_pjsip SIP stack that is based on
> >  Teluu's "pjproject" SIP stack.
> > [...]
> >  The actual pjproject source code is NOT distributed with Asterisk.
> >  Instead the Asterisk build process downloads the official pjproject
> >  tarball then patches, configures and builds pjproject when you build
> >  Asterisk."
> > 
> > This patch allows to use a buildroot-build libpjsip with all patches,
> > except 0000-remove-third-party.patch, provided by Asterisk.  
> 
> I don't understand the story about 0000-remove-third-party.patch. Could
> you explain ? All patches are provided by Asterisk, they are at
> https://github.com/asterisk/asterisk/tree/16.0/third-party/pjproject/patches.
> 
> One issue with this is that 16.0 is a branch name, so the patches that
> you download are not guaranteed to be stable over time.
> 
> Also, what is the upstream status of those patches ? Is Asterisk
> actively contributing those patches to upstream pjsip, or are they
> doing de-facto a fork of it ?

You have not replied to those comments, and this is blocking the merge
of PATCH 6/9 and 9/9 in this series. Since it's been a while, I'll mark
them as Changes Requested, so that you can address the
questions/comments. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
