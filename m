From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 20 Jan 2016 11:14:45 +0000
Subject: [Buildroot] [PATCH v4 2/3] toolchain/external: add MIPS
 Codescape MTI GNU Linux toolchain
In-Reply-To: <20160120105916.5f86c027@free-electrons.com>
References: <1450196485-19214-1-git-send-email-Vincent.Riera@imgtec.com>
 <1450196485-19214-2-git-send-email-Vincent.Riera@imgtec.com>
 <20160120105916.5f86c027@free-electrons.com>
Message-ID: <569F6C25.9010102@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 20/01/16 09:59, Thomas Petazzoni wrote:
> Vicente,
> 
> On Tue, 15 Dec 2015 16:21:24 +0000, Vicente Olivert Riera wrote:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>> Changes v3 -> v4:
>>  - Move the changes to helpers.mk into a separate patch.
> 
> I've applied patches 2 and 3 to add the two MIPS Codescape toolchains,
> after rebasing on top of master, and removing the version number of the
> Config.in options.

Yeah, the patches were sent when we were supporting different versions
of the same toolchain, so the version number was necessary. But now that
we only support one version of each one is no longer necessary to have
the version number in the name.

Thanks!

Vincent.

> 
> Thanks!
> 
> Thomas
> 
