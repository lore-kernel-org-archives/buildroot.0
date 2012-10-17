From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Oct 2012 00:19:27 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-ng: vendor part of
 tuple should be 'buildroot'
In-Reply-To: <201210172349.13982.yann.morin.1998@free.fr>
References: <1350510369-15364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201210172349.13982.yann.morin.1998@free.fr>
Message-ID: <507F2EEF.7060400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/10/12 23:49, Yann E. MORIN wrote:
> On Wednesday 17 October 2012 Thomas Petazzoni wrote:
>> >  Since 11017f081fc5b034e680d89eaea729c19f450e01, the Crosstool-ng
>> >  backend generates toolchains that have a prefix inconsistent with what
>> >  Buildroot expects. Buildroot expects a "buildroot" vendor name, while
>> >  Crosstool-NG builds toolchain with the "unknown" vendor name.
>> >
>> >  This is causing build failure such as:
>> >
>> >     http://autobuild.buildroot.org/results/15b2c0e50a81b86dd13af684c9254df2bc0df8de/build-end.log
>> >
>> >  Fix this by changing the vendor part of the tuple used by Crosstool-NG
>> >  to "buildroot".
>> >
>> >  Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> Acked-by: "Yann E. MORIN"<yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  I had the very same patch lined up but forgot to commit and mail it...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
