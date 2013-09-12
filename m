From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 20:33:59 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
Message-ID: <20130912203359.7e650ebe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ANDY KENNEDY,

On Thu, 12 Sep 2013 18:25:40 +0000, ANDY KENNEDY wrote:

> This sounds much like the way Linux does things for the IP related
> drivers.  Is that the intent we are going for (personally, I think this
> is a GREAT idea, as it allows companies to have IP related widgets in
> BuildRoot without the fear of being REQUIRED to push back their secret
> sauce)?
> 
> If that is what you intend, you have my vote!

I am not sure what you mean by "IP related drivers". Do you mean
proprietary drivers?

It is true that the BR2_EXTERNAL thing raises a licensing question:
should the BR2_EXTERNAL contents also be released under GPLv2, like the
rest of Buildroot? Do we really want the root filesystem overlays and
other highly project-specific contents be released under GPLv2 ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
