From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Mar 2013 12:48:02 +0100
Subject: [Buildroot] [PATCH 6/6] package/mtools: new host-package
In-Reply-To: <513FB92F.4010107@mind.be>
References: <cover.1362693294.git.yann.morin.1998@free.fr>
 <296699691239a90d5118c5cbe72f1ff57b3761a5.1362693294.git.yann.morin.1998@free.fr>
 <20130310124944.261867c4@skate>
 <201303110102.06732.yann.morin.1998@free.fr>
 <513F62F0.6050303@lucaceresoli.net>
 <CAAXf6LX26RGbawv-RYHA6HKNs3myuiJpNgZ1u2drABrFsudkQg@mail.gmail.com>
 <513FB92F.4010107@mind.be>
Message-ID: <20130315124802.1aab5a82@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 13 Mar 2013 00:24:31 +0100, Arnout Vandecappelle wrote:

> > But, instead of an extra column, wouldn't it be more clear to separate
> > the legal-license manifest files for host and target packages? This
> > would result in a manifest-host.csv and manifest.csv. Packages that
> > appear on both host and target, would be present in both files. An end
> > user that is only interested in getting a list of target packages, can
> > find that info in a glance.
> 
>   Very good idea.

I don't know if creating a separate file is needed. Maybe just a need
field in the CSV that says if it's a host package only, target package
only, or both. But that's a minor detail, I don't have a strong opinion
between a single CSV file, and two CSV files, as long as it is possible
to identify what is on the target and what isn't.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
