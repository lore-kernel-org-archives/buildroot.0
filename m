From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Apr 2017 20:47:55 +0200
Subject: [Buildroot] [PATCH 3/5] telit_evk_pro3_defconfig: remove broken
	defconfig
In-Reply-To: <f6a4dcf2-1bc2-537d-9ba9-bd12ad0f4fca@mind.be>
References: <20170301083046.13226-1-arnout@mind.be>
 <20170301083046.13226-3-arnout@mind.be>
 <CAHkwnC_M3=cTtes4_Qc3Jig2+Q7=eJ=A4WoNsRFomLWuwJ_kKw@mail.gmail.com>
 <f6a4dcf2-1bc2-537d-9ba9-bd12ad0f4fca@mind.be>
Message-ID: <CAHkwnC_eF0eCKAN=MaMGYS5hVB_NNdMt6DbigPD9Jh1Gqkt-Xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-04-06 12:50 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Fabio,
>
> On 01-03-17 17:28, Fabio Porcedda wrote:
>> 2017-03-01 9:30 GMT+01:00 Arnout Vandecappelle (Essensium/Mind)
>> <arnout@mind.be>:
>>> This defconfig has been broken due to gcc5 for more than half a year,
>>> and nobody stepped up to fix it. Remove it, as well as it board
>>> directory.
>>
>> Hi Arnout,
>> sorry for the late response, today I've sent a patch to fix the build
>> failure for barebox, tomorrow i will send a patch to update the linux
>> kernel.
>
>  Any update on that kernel patch? The telit defconfig is still broken...

Hi Arnout,
I'm sorry for the delay, the next week I will send a patch for the kernel too.

Best regards
--
Fabio Porcedda
