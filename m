From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 17 Sep 2020 19:55:08 +0200
Subject: [Buildroot] [PATCH v3 04/11] board/qemu: add IBM s390x and Z
 arch support
In-Reply-To: <87tuvw23ok.fsf@oc8242746057.ibm.com>
References: <20200916055934.609436-1-egorenar@linux.ibm.com>
 <20200916055934.609436-5-egorenar@linux.ibm.com>
 <a79e13e6-902e-c351-c292-383660e06451@gmail.com>
 <87wo0t2gob.fsf@oc8242746057.ibm.com>
 <a2616806-51ae-c3b8-e5d6-1ba0daa2298f@gmail.com>
 <87tuvw23ok.fsf@oc8242746057.ibm.com>
Message-ID: <5715172a-29a7-ff0a-a727-0911b9bd2aa2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

Le 17/09/2020 ? 10:44, Alexander Egorenkov a ?crit?:
> Romain Naour <romain.naour@gmail.com> writes:
> 
>>
>> Yes, I'm on a f31 x86_64 host.
>> I tested several time and it boot time to time.
>> I didn't investigated further, but it seems a problem around the RNG driver.
>>
> 
> Could you please add "initcall_debug debug" to the kernel command line
> and send the console output back when it crashed ?

https://pastebin.com/TmGkmQNJ

Best regards,
Romain

> 
> Thanks
> Regards
> Alex
> 
