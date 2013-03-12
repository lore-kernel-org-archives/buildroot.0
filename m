From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2013 00:24:31 +0100
Subject: [Buildroot] [PATCH 6/6] package/mtools: new host-package
In-Reply-To: <CAAXf6LX26RGbawv-RYHA6HKNs3myuiJpNgZ1u2drABrFsudkQg@mail.gmail.com>
References: <cover.1362693294.git.yann.morin.1998@free.fr>
 <296699691239a90d5118c5cbe72f1ff57b3761a5.1362693294.git.yann.morin.1998@free.fr>
 <20130310124944.261867c4@skate> <201303110102.06732.yann.morin.1998@free.fr>
 <513F62F0.6050303@lucaceresoli.net>
 <CAAXf6LX26RGbawv-RYHA6HKNs3myuiJpNgZ1u2drABrFsudkQg@mail.gmail.com>
Message-ID: <513FB92F.4010107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/13 18:40, Thomas De Schampheleire wrote:
> Hi,
>
> On Tue, Mar 12, 2013 at 6:16 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
[snip]
>> Bottom line, I think it would be useful to save in the package manifest
>> an additional column stating whether the package is on the target, on
>> the host, or both. But skipping host-only packages is not safe.

  I agree. And I have a second reason for that: I have one customer who 
distributes an "SDK", i.e. host packages.


> I follow Luca's reasoning here. As we discussed on the Buildroot
> Developer Day 2012, we will include the toolchain/host sources
> precisely for the above reasons, and so they should be described in a
> manifest. I also agree with Thomas' point about the confusion.
>
> But, instead of an extra column, wouldn't it be more clear to separate
> the legal-license manifest files for host and target packages? This
> would result in a manifest-host.csv and manifest.csv. Packages that
> appear on both host and target, would be present in both files. An end
> user that is only interested in getting a list of target packages, can
> find that info in a glance.

  Very good idea.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
