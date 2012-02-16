From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2012 10:47:26 +0100
Subject: [Buildroot] [PATCH 1/1] toolchainfile.cmake: fix lifetime
In-Reply-To: <CAHXCMMLsaGQqK6cwB2QW_YziSdmTJz8kv9aC3zRgJr8=NjQCrQ@mail.gmail.com>
References: <1329382425-2288-1-git-send-email-s.martin49@gmail.com>
 <CAHXCMMLsaGQqK6cwB2QW_YziSdmTJz8kv9aC3zRgJr8=NjQCrQ@mail.gmail.com>
Message-ID: <201202161047.27002.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 16 February 2012 09:59:16 Samuel Martin wrote:
> Note that another way to correctly mange the lifetime of the
> toolchainfile.cmake file could be to store it in the TOOLCHAIN_DIR.

 I would prefer that.  I don't like the way it looks now, with the .cmake
file lying around in the output directory.

 
 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
