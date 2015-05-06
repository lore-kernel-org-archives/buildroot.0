From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Wed, 06 May 2015 11:16:17 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150505154826.65c104f8@free-electrons.com>
References: <20150505063016.079181016A5@stock.ovh.net>	<20150505095952.4ddfd5b4@free-electrons.com>	<5548C487.90604@gmail.com>
 <20150505154826.65c104f8@free-electrons.com>
Message-ID: <5549DBE1.1010803@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas,

On 05.05.2015 15:48, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 05 May 2015 15:24:23 +0200, Pascal Huerst wrote:
> 
>> According to:
>>
>> https://breakpad.appspot.com/2824002/
>>
>> support has been added for release r1407. I tried to build that
>> revision, but I got the same error as reported above. I'm not really
>> familiar with the internals of breakpad, but I asked on the breakpad
>> mailing list. Maybe someone there already knows that issue... I'll keep
>> you updated.
> 
> Thanks. We'll wait a bit for them to give some feedback, and if it
> doesn't come soon enough, we'll disable breakpad on aarch64 for now.

Looks like there is a patch in pipeline, but not applied, yet. I would
suggest to disable breakpad for AArch64 for now and re-enable it on a
next version bump.

pending patch:

https://breakpad.appspot.com/10734002/

and Mike's reply:

https://groups.google.com/forum/#!topic/google-breakpad-discuss/PpWkw79SVIs

regards
Pascal
