From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Oct 2011 23:24:53 +0200
Subject: [Buildroot] [PATCH] gdb: bump to 7.3.1
In-Reply-To: <20110930222606.2ed76af5@skate>
References: <4E856673.8020205@visionsystems.de> <20110930222606.2ed76af5@skate>
Message-ID: <201110012324.54139.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 30 September 2011 22:26:06, Thomas Petazzoni wrote:
> Yegor,
> 
> Can you send a patch with a proper description, so that it can be
> applied with git am ?
> 
> By proper description I mean :
> 
>  * Don't forget that everything before the --- is kept in the commit
>    log, so don't put "personal" explanations.

 Actually, you can put "personal" explanations after the ---.  So the 
following would work:

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
On my old build system (openSUSE 10.3) I had problems compiling GDB saying 
something like my glibc is too old. So I tried the latest version and could 
compile without a problem. See the patch below.

Yegor 
---
 toolchain/gdb/Config.in |    6 ++++++
 1 file changed, 6 insertions(+)


 I typically use that for the changelog of single patches.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
