From: Jerome Forissier <jerome.forissier@linaro.org>
Date: Thu, 6 Sep 2018 10:26:21 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: add 4.18.x choice for headers
In-Reply-To: <20180906100534.6fe06c24@windsurf>
References: <20180906074216.32688-1-jerome.forissier@linaro.org>
 <20180906100534.6fe06c24@windsurf>
Message-ID: <a6dfad19-be6b-254e-7b95-a67eec49b28c@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/06/2018 10:05 AM, Thomas Petazzoni wrote:
> Hello J?r?me,
> 
> On Thu,  6 Sep 2018 09:42:16 +0200, Jerome Forissier wrote:
>> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
>> ---
>>  toolchain/Config.in                                                  | 5 +++++
>>  .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
>>  2 files changed, 9 insertions(+)
>>
>> FYI, this is needed in order to use the GCC 8.2.x recently published by
>> Arm [1] as an external toolchain.
>>
>> [1] https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads
> 
> Thanks for this patch. In fact, we already have this in our "next"
> branch:
> 
>   https://git.buildroot.org/buildroot/commit/toolchain?h=next&id=7f62d8122bc42b84608cad34fb005b4870c143d5

Ah, sorry for missing it. In fact I did not know about the existence of
the "next" branch. Would you consider a patch to mention it in
docs/manual/contribute.txt? I also got bitten by the fact that you need
to be subscribed to the ML for patches to go through. Maybe another
thing that {c,sh}ould be mentioned in the doc?

> 
> But we could indeed have it in the master branch, so that the most
> recent toolchains can be used even with our upcoming 2018.08 release.

Yes, that would help indeed.

Thanks,
-- 
Jerome

> Best regards,
> 
> Thomas
> 
