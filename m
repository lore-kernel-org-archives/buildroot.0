From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Feb 2012 15:38:21 +0100
Subject: [Buildroot] [PATCH 1/1] toolchainfile.cmake: fix lifetime
In-Reply-To: <201202161047.27002.arnout@mind.be>
References: <1329382425-2288-1-git-send-email-s.martin49@gmail.com>
 <CAHXCMMLsaGQqK6cwB2QW_YziSdmTJz8kv9aC3zRgJr8=NjQCrQ@mail.gmail.com>
 <201202161047.27002.arnout@mind.be>
Message-ID: <20120216153821.3db68aef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 16 Feb 2012 10:47:26 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  I would prefer that.  I don't like the way it looks now, with
> the .cmake file lying around in the output directory.

No, not in $(TOOLCHAIN_DIR), because the CMake toolchain file must be
part of our SDK, so it should be moved somewhere into $(HOST_DIR).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
