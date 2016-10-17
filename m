From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Oct 2016 14:15:08 +0200
Subject: [Buildroot] [PATCH] qt5webkit: fix building in Python 3
 environment
In-Reply-To: <CAGm1_kuE3c=-pbGwGiXU+r-PUikz3oUG4d8COzHBTVoacWyQRQ@mail.gmail.com>
References: <1476451574-31822-1-git-send-email-yegorslists@googlemail.com>
 <20161014154013.231da448@free-electrons.com>
 <CAGm1_kuirawLGrFj3hTAOAn46Uj8+F6UVuB-m_Kxb65HO3zRmQ@mail.gmail.com>
 <2742504b-33f2-0fcc-cc7a-8297e563bc6b@mind.be>
 <CAGm1_kuE3c=-pbGwGiXU+r-PUikz3oUG4d8COzHBTVoacWyQRQ@mail.gmail.com>
Message-ID: <20161017141508.32b6f3bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 12:29:48 +0200, Yegor Yefremov wrote:

> I've reverted the patch with python 2 workaround, changed all
> occurrences of python in qt5webkit build files to python3 and compiled
> the stuff again, but it
> doesn't fail. My build system has following Python versions:
> 
> Python 2.7.9
> Python 3.4.2
> 
> It would be interesting to know, what python versions were on this
> particular build machine, that caused build failures. Where can I get
> such information?

Look at the "submitter" file available in each build result. It tells
you on which autobuilder the build took place. Then you can get in
touch with the relevant people so that they can reproduce the problem,
or give additional details about the autobuilder setup.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
