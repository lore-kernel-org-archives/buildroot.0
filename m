From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 13 Mar 2014 17:38:48 +0100
Subject: [Buildroot] host-fakeroot archive not sourced any more?
In-Reply-To: <CAHkwnC-MWz654MAc9Gfx1UptPkDeCnSp=tjJq9=k7U6J296wew@mail.gmail.com>
References: <532033B2.9030903@freescale.com>
 <CAAXf6LXkv15AhY+2GaBG6pxgs0TpgX3SiY_EQP1Se4X5P2SwDA@mail.gmail.com>
 <CAHkwnC_XBGoHGKVaTuS5_U601uASbzxwP-wF2X5Po6Ezo-PJAw@mail.gmail.com>
 <CAHkwnC99ifVpDJPBnMD+4rsWcykfMf2U4KTrtZRYqpkRVUfy1w@mail.gmail.com>
 <53206B17.2000409@freescale.com>
 <CAHkwnC-MWz654MAc9Gfx1UptPkDeCnSp=tjJq9=k7U6J296wew@mail.gmail.com>
Message-ID: <CAHkwnC8xxvnp9sf5+gofXYHRQbANkUdonht1W59FBnLRMBb+6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 12, 2014 at 3:25 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> On Wed, Mar 12, 2014 at 3:11 PM, Vincent Stehl?
> <vincent.stehle@freescale.com> wrote:
>> On 03/12/2014 01:44 PM, Fabio Porcedda wrote:
>>>
>>> -               $(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS))),\
>>> +               $(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS)
>>> $(TARGETS_ROOTFS))),\
>>
>>
>> Hi Fabio,
>>
>> Thanks for the patch; I confirm it repairs fakeroot fetching. I'll start to
>> use it instead of the reverts and see how it goes.
>
> Great!
> Thanks for testing it and sorry for the trouble.
> I will send tomorrow the patch to the mailing list, maybe an improved
> version because i fear that i need to add TARGETS_ROOTFS in more
> places.

Patch sent:
http://patchwork.ozlabs.org/patch/330004/

Regards
-- 
Fabio Porcedda
