From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Apr 2020 22:03:38 +0200
Subject: [Buildroot] [PATCH v5 0/5] gitlab Qemu runtime testing
In-Reply-To: <20200413195614.GX29898@scaer>
References: <20200217205030.8157-1-romain.naour@smile.fr>
 <20200413195614.GX29898@scaer>
Message-ID: <2a3b16a5-4f03-77c1-374e-736445b94209@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 13/04/2020 ? 21:56, Yann E. MORIN a ?crit?:
> Roma, Jugurtha, All,
> 
> On 2020-02-17 21:50 +0100, Romain Naour spake thusly:
>> This new iteration take into account the previous review with
>> some additional rework [1] [2] [5] [6].
>>
>> Remove patch already merged.
>>
>> Based on the Yann's review during the Buildroot Developper meeting
>> FOSDEM 2020 [2], add a tag in each readme file to easily retrieve
>> the qemu command line to be used for runtime testing in gitlab.
>>
>> This tag is used by a post-image script to generate a script
>> called start-qemu.sh that can be used by users or by a new python
>> script for running the test in gitlab but only when a Qemu
>> defconfig is built.
>>
>> Finally add this new python script to .gitlab-ci.yml.
>>
>> This series has been tested on Gitlab [3], please ignore the
>> failing test related to missing host-python3 modules needed by
>> optee-os package [4].
> 
> I've finally applied this series, after reworking in-depth the two
> scripts. Please review the commits and watch the pipelines, and yell at
> me if I broke it too badly... Thanks you!

Thanks you too for improving the series!

Best regards,
Romain


> 
> Regards,
> Yann E. MORIN.
> 
