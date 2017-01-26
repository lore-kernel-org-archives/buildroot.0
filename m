From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 26 Jan 2017 18:46:28 +0100
Subject: [Buildroot] Relocatable internal toolchain
In-Reply-To: <CAHXCMML2HKsOgxZRLpcMbCY8Lci6-N_s1+qVTRxCHqyvP+rzgg@mail.gmail.com>
References: <57c96cfd-7d0c-c9de-04d2-2da8f5dd7f7c@grandegger.com>
 <CAHXCMML2HKsOgxZRLpcMbCY8Lci6-N_s1+qVTRxCHqyvP+rzgg@mail.gmail.com>
Message-ID: <11e6deef-d790-33d8-b0ad-3477a51e369f@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

Am 26.01.2017 um 11:47 schrieb Samuel Martin:
> Hi Wolfgang, all,
>
> On Thu, Jan 26, 2017 at 9:25 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
>> Hello,
>>
>> I prefer a relocatable (internal) toolchain and before digging deeper... Are
>> there any plans in that direction? I realized some attempts (patches) to
>> make the buildroot toolchain relocatable but they have not (yet) been
>> accepted. What are the pros and cons? Are there principle problems?
>
> Yes, there are plans for this.

Great!

> There had been a couple of the series posted on this topic (the latest one [1]).
> And we talked about this during the last Buildroot Meeting, you can
> check the report [2] for detailed conclusions.
> To sum-up:
> - Producing the relocatable host tools will be addressed step-by-step;
> - Preparatory changes making buildroot using absolute canonical paths
> are already merged [4];
> - Next step: fixing RPATH in host tools binaries thanks to some
> patchelf [3] features to be implemented and upstreamed (this should be
> enough to meet Buildroot needs);
> - Cleaning up RPATH in target binaries is delayed.
>
> Unfortunately, I got no freetime to spend on patchelf source code
> [3] since the meeting.

Thanks for the quick introduction...

> If you are interested in or want to take over this topic, don't
> hesitate to drop a message on the Buildroot mailing list.

I will have a closer look. Let's see if I can do something.

Wolfgang.
