From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Dec 2012 10:31:12 +0100
Subject: [Buildroot] [git commit] libtool: undeprecate for now
In-Reply-To: <20121203092529.05e8d34c@skate>
References: <20121203010304.2A651996F6@busybox.osuosl.org>
 <20121203092529.05e8d34c@skate>
Message-ID: <50BC7160.80803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/12 09:25, Thomas Petazzoni wrote:
> Dear Peter Korsgaard,
>
> On Sun, 2 Dec 2012 16:31:54 -0800, Peter Korsgaard wrote:
>> commit: http://git.buildroot.net/buildroot/commit/?id=f619d5ba20ef46c57259f35a21bb98b7c85c35a4
>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> Pulseaudio selects libtool, so get rid of the deprecated annotation so
>> people don't get warnings about unmet dependencies when exiting menuconfig.
>
> Pulseaudio needs libtool on the target? This sounds strange, no?

  It needs libltdl, I guess to read .la files for plugins. That said, I wonder if
it even works since we remove the .la files... I started to look at it a while
ago but never got anywhere.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
