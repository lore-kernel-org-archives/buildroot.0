From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Oct 2015 13:01:56 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-10-06
In-Reply-To: <5614F1A6.2030403@imgtec.com>
References: <20151007063018.D494C102352@stock.ovh.net>
 <5614F1A6.2030403@imgtec.com>
Message-ID: <561509B4.9000408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-10-15 11:19, Vicente Olivert Riera wrote:
> Dear Thomas Petazzoni,
> 
> On 10/07/2015 07:30 AM, Thomas Petazzoni wrote:
>> Build statistics for 2015-10-06
>> ===============================
> 
>>     mips64el |                      pcre-8.37 | NOK | http://autobuild.buildroot.net/results/77f1c33d4315cce3f2d2387aa1368a63caac7468/
> 
> I'm unable to reproduce this failure even using the same .config file.
> 
> The failure looks like this:
> 
> configure: error: You need a C++ compiler for C++ support.
> 
> But the toolchain used in that config file does have a C++ compiler:
> 
> $ file output/host/opt/ext-toolchain/bin/mips64el-ctng_n64-linux-gnu-g++
> output/host/opt/ext-toolchain/bin/mips64el-ctng_n64-linux-gnu-g++: ELF
> 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked
> (uses shared libs), for GNU/Linux 2.6.18, stripped
> 
> This was reported by your gcc75 autobuilder. Could you please have a look?

 gcc75 => probably a bitflip?

 Regards,
 Arnout

> 
> Regards,
> 
> Vincent.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
