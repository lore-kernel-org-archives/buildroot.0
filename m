From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Jun 2017 23:17:36 +0200
Subject: [Buildroot] [PATCH] package/gdb: add support for gdb 8.0
In-Reply-To: <20170611181043.0de6329f@windsurf.home>
References: <20170605204648.11780-1-romain.naour@gmail.com>
 <20170611181043.0de6329f@windsurf.home>
Message-ID: <e2edd343-47ed-146f-be62-419a61b52242@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-06-17 18:10, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon,  5 Jun 2017 22:46:48 +0200, Romain Naour wrote:
>> Add a dependency on gcc >= 4.8 since gdb needs a C++11 compiler.
>>
>> Remove included patch since 7.12.1:
>> 0001-Remove-const-in-xtensa-linux-nat.c-fetch_gregs.patch
>> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=d274ecf4ddf76768af57e27f654b9ce6784b391c
>>
>> Rebase remaining patches:
>> 0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
>> 0003-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
>>
>> See https://sourceware.org/ml/gdb-announce/2017/msg00003.html
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>> This patch is rebased after [1], [2] and [3]
> 
> Applied to master, thanks. Do you intend to send a patch that updates
> the default gdb version to 7.12, and drop support for 7.10 ?

 Since we've been discussing version dropping, perhaps it's time to consider gdb
as well.

 Is there really any reason to support multiple versions of gdb?

 If yes, is there a reason to not use the latest version as default?

 And the same questions for binutils.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
