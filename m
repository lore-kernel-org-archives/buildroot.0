From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 19:11:29 +0200
Subject: [Buildroot] [V2] 4th: new package
In-Reply-To: <CAB0FRss1DfjWSa6K9w0Np99ntsxiUsZgq9ZO55zBiqz6PKmwzA@mail.gmail.com>
References: <1467745520-4449-1-git-send-email-francois.perrad@gadz.org>
 <20160705224152.2e1e3161@free-electrons.com>
 <CAB0FRss1DfjWSa6K9w0Np99ntsxiUsZgq9ZO55zBiqz6PKmwzA@mail.gmail.com>
Message-ID: <20160706191129.5ce72b33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Jul 2016 19:04:54 +0200, Fran?ois Perrad wrote:

> >> +4TH_VERSION = 3.62.4
> >> +4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
> >> +4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
> >> +4TH_LICENSE = GPLv3, LGPLv3
> >> +4TH_LICENSE_FILES = COPYING  
> >
> > Did you resolve the licensing issue? That was the main point of my
> > previous review:  
> 
> After double checking, it appears that most of files in the latest
> release are under GPLv3 and the others are under LGPLv3.

OK, but the COPYING file still only indicates LGPLv3. But I guess the
upstream project is no longer alive, so there is no chance to see this
fixed :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
