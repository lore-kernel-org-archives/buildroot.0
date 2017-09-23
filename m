From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:21:18 +0200
Subject: [Buildroot] [PATCH] openjpeg: fix build without C++ support
In-Reply-To: <20170923171812.9111-1-peter@korsgaard.com>
References: <20170923171812.9111-1-peter@korsgaard.com>
Message-ID: <5f43aef5-c70d-cf29-beba-ace9838bc23f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-09-17 19:18, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/e2f/e2ff0a7fa2b911157edf6c43a8eed797b22edd46/
> http://autobuild.buildroot.net/results/670/6706339e7df2f2e7d0d7a15663bed185ca55c2a1/
> 
> Openjpeg is written in C, but with the move to CMake the build system now
> errors out if a C++ compiler isn't available.  Fix it by patching the
> CMakeLists.txt to not require C++ support.
> 
> Patch submitted upstream:
> https://github.com/uclouvain/openjpeg/pull/1027
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
