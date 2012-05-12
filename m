From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 May 2012 16:47:38 +0200
Subject: [Buildroot] [PATCH 0/3] Add CONF_ENABLE and CONF_PKG_ENABLE
 helper functions
In-Reply-To: <20120512130504.7ef01d0f@skate>
References: <1335647781-16536-1-git-send-email-arnout@mind.be>
 <20120507162139.44a814e9@skate> <4FAD92BB.5040606@mind.be>
 <20120512130504.7ef01d0f@skate>
Message-ID: <4FAE780A.4050709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/12 13:05, Thomas Petazzoni wrote:
>> >     I was probably just trying too hard to support all possible use cases.
>> >  What about adding something like:
>> >
>> >  SYSTEMD_AUTO_CONF_ENABLE_DEPS += acl
>> >
>> >  which would get expanded to the whole ifeq thing in the AUTOTARGETS call?
>> >  This only works if the buildroot package name is the same as the
>> >  --enable/--disable option, but that already catches many cases.
> I am still personally not a big fan of this. What's happening is really
> too magic.

  Okay, fair enough.

  Maybe I should concentrate on the MAKETARGETS instead :-)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
