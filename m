From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 01 Jul 2016 10:03:28 -0300
Subject: [Buildroot] [PATCH v2 1/6] qemu_mips_malta_defconfig: move to
 qemu_mips32r2_malta_defconfig
In-Reply-To: <20160701150051.478b11f0@free-electrons.com>
References: <1467365245-24123-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160701150051.478b11f0@free-electrons.com>
Message-ID: <9dc07ea69f205b7bd1b4244361fbfdcf@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-07-01 10:00, Thomas Petazzoni wrote:

> Hello,
> 
> On Fri, 1 Jul 2016 10:27:20 +0100, Vicente Olivert Riera wrote:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>> Changes v1 -> v2:
>>  - Use mips32r2 instead of mips_32r2 in the defconfig name.
>>  - Use mips32r2 instead of mips-32r2 in the board dir name.
> 
> Entire series applied to master, after tweaking the commit titles.
> 
> Note that I hesitated a bit, since I'm not sure how worth it it is to
> have 8 different Qemu configuration for MIPS. It starts to be quite a
> lot.
> 
> Thanks,
> 
> Thomas

Hi.
I've hesitated a bit as well, but then r2 and r6 cores are quite a bit 
different and it's good to have some way of testing toolchain output.
Regards.
