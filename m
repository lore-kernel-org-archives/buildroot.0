From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 22:19:28 +0200
Subject: [Buildroot] eclipse luna & buildroot toolchain integration:
 problem with latest luna update.
In-Reply-To: <E12AC747A2CC47AFBF299EF9CEE6C899@JohanW7>
References: <E12AC747A2CC47AFBF299EF9CEE6C899@JohanW7>
Message-ID: <20140513221928.2c026e44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

Thanks for the report. I'm Cc'ing M?lanie Bats, who is responsible for
our Eclipse integration.

Thomas

On Tue, 13 May 2014 22:10:52 +0200, Sagaert Johan wrote:
> Hi
> 
> When checking for updates in eclipse luna:
> Eclipse complains :
>  
> Cannot complete the install because of a conflicting dependency.
>   Software being installed: Eclipse IDE for C/C++ Developers 4.4.0.20140508-1754 (epp.package.cpp 4.4.0.20140508-1754)
>   Software currently installed: Buildroot SDK Feature 3.0.0.201308291052 (org.buildroot.bundle.feature.feature.group
> 3.0.0.201308291052)
>   Software currently installed: Local Terminal (Incubation) 0.2.300.201307231220 (org.eclipse.tm.terminal.local.feature.group
> 0.2.300.201307231220)
>   Only one of the following can be installed at once: 
>     CDT Build System Core 8.2.0.201308291048 (org.eclipse.cdt.managedbuilder.core 8.2.0.201308291048)
>     CDT Build System Core 8.3.0.201405061918 (org.eclipse.cdt.managedbuilder.core 8.3.0.201405061918)
>   Cannot satisfy dependency:
>     From: Eclipse IDE for C/C++ Developers 4.4.0.20140508-1754 (epp.package.cpp 4.4.0.20140508-1754)
>     To: org.eclipse.epp.package.cpp.feature.feature.group [4.4.0.20140508-1754]
>   Cannot satisfy dependency:
>     From: Buildroot SDK Feature 3.0.0.201308291052 (org.buildroot.bundle.feature.feature.group 3.0.0.201308291052)
>     To: org.buildroot.cdt.toolchain.feature.feature.group [3.0.0.201308291048]
>   Cannot satisfy dependency:
>     From: Buildroot Toolchain 3.0.0.201308291048 (org.buildroot.cdt.toolchain.feature.feature.group 3.0.0.201308291048)
>     To: org.eclipse.cdt.managedbuilder.core.feature.patch.feature.group [1.0.0.201308291048]
>   Cannot satisfy dependency:
>     From: C/C++ Stand-alone Debugger 1.0.0.201405061918 (org.eclipse.cdt.debug.application 1.0.0.201405061918)
>     To: bundle org.eclipse.cdt.managedbuilder.core 8.2.1
>   Cannot satisfy dependency:
>     From: CDT Standalone Debugger Support 1.0.0.201405061918 (org.eclipse.cdt.debug.standalone.feature.group 1.0.0.201405061918)
>     To: org.eclipse.cdt.debug.application [1.0.0.201405061918]
>   Cannot satisfy dependency:
>     From: EPP CPP Feature 4.4.0.20140508-1754 (org.eclipse.epp.package.cpp.feature.feature.group 4.4.0.20140508-1754)
>     To: org.eclipse.cdt.debug.standalone.feature.group 0.0.0
>   Cannot satisfy dependency:
>     From: Local Terminal (Incubation) 0.2.300.201307231220 (org.eclipse.tm.terminal.local.feature.group 0.2.300.201307231220)
>     To: org.eclipse.cdt.platform.feature.group 7.0.0
>   Cannot satisfy dependency:
>     From Patch: org.eclipse.cdt.managedbuilder.core.feature.patch.feature.group 1.0.0.201308291048 C/C++ Development Platform
> 8.4.0.201405061918 (org.eclipse.cdt.platform.feature.group 8.4.0.201405061918)
>     To: org.eclipse.cdt.managedbuilder.core [8.2.0.201308291048] 
>  
> I was using http://buildroot.org/downloads/eclipse/kepler, this worked well in Luna M6
> 
> 
> Regards, Johan
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
