From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Mon, 29 Mar 2021 10:14:43 +0200
Subject: [Buildroot] [PATCH 1/1] linux: support uncompressed kernel
In-Reply-To: <20210328225019.38dcfda6@windsurf.home>
References: <20210324114522.285121-1-egorenar@linux.ibm.com>
 <20210328225019.38dcfda6@windsurf.home>
Message-ID: <87lfa6tlzg.fsf@oc8242746057.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> On Wed, 24 Mar 2021 12:45:22 +0100
> Alexander Egorenkov <egorenar@linux.ibm.com> wrote:
>
>> Enables to build an uncompressed Linux kernel.
>> 
>> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
>> ---
>>  linux/Config.in | 3 +++
>>  linux/linux.mk  | 1 +
>>  2 files changed, 4 insertions(+)
>
> I have applied, after making the option conditional on BR2_s390x, as
> suggested by Peter. Thanks!
>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thank you very much

Regards
Alex
