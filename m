From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jul 2016 15:02:47 +0200
Subject: [Buildroot] [PATCH] squashfs: update site to git.kernel.org
In-Reply-To: <CANQCQpY3ZRoWL96QyHKNNrsOhocnAc_Zgr4-btghdGqCfDVb1A@mail.gmail.com>
References: <1469655138-65197-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160728100831.5a415350@free-electrons.com>
 <CANQCQpY3ZRoWL96QyHKNNrsOhocnAc_Zgr4-btghdGqCfDVb1A@mail.gmail.com>
Message-ID: <20160728150247.6672f9ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 07:59:46 -0500, Matthew Weber wrote:

> > Yeah, but they haven't made any release since the last one available
> > from sourceforge. Are they planning on doing a new release? What is the
> > motivation from moving from a stable release to some seemingly random
> > Git commit?
> >  
> We pulled in that latest hash to fix a threading issue that we were seeing
> on our large build machines. When creating images with 64 cores we would
> sometimes get corrupted images that would fail to boot.

OK. Exactly the type of explanation that would have been good to have
in the commit log :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
