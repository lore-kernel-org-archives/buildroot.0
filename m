From: Florian Fainelli <f.fainelli@gmail.com>
Date: Sun, 14 Jun 2020 14:34:28 -0700
Subject: [Buildroot] ebtables and musl
In-Reply-To: <CAGt4E5v4-5FxqZTENCMreZah33Yo8A3NJNactKK9BfMJzKxUPg@mail.gmail.com>
References: <CAGt4E5tuHRkxko=NPY+-YsWwnhk1McnJMU_LmdcShHFuRjTkMA@mail.gmail.com>
 <20200613132317.4edb7676@gmx.net> <20200613144325.6c88eb8d@gmx.net>
 <CAGt4E5s_t30GHmTFiSA3MZQo0Vj-fkqvGPPc9kNdoa6w6-B7DA@mail.gmail.com>
 <87lfkqe4hk.fsf@tarshish>
 <CAGt4E5v4-5FxqZTENCMreZah33Yo8A3NJNactKK9BfMJzKxUPg@mail.gmail.com>
Message-ID: <8843cd27-6553-986e-92d5-e210a3f678f0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 6/13/2020 8:34 PM, Markus Mayer wrote:
> On Sat, 13 Jun 2020 at 20:00, Baruch Siach <baruch@tkos.co.il> wrote:
>>
>> Hi Markus,
>>
>> On Sat, Jun 13 2020, Markus Mayer wrote:
>>
>>> On Sat, 13 Jun 2020 at 05:43, Peter Seiderer <ps.report@gmx.net> wrote:
>>>> On Fri, 12 Jun 2020 13:10:28 -0700, Markus Mayer <mmayer@broadcom.com> wrote:
>>>>>> While we are on the topic of ebtables, why is buildroot still using
>>>>>> v2.0.10-4 from 2014 when there is 2.0.11 from 2019 (as per
>>>>>> http://ftp.netfilter.org/pub/ebtables/)? Is it just a matter of
>>>>>> submitting a patch to update it or is there an underlying reason to
>>>>>> keep the old version around?
>>>>>
>>>>> Probably not, care to send an ebtables update patch?
>>>
>>> Sure. I'll send a patch.
>>
>> We have a version upgrade patch in patchwork:
>>
>>   http://patchwork.ozlabs.org/project/buildroot/patch/20200427212653.29933-1-ryanbarnett3 at gmail.com/
>>
>> You might want to test and contribute your Tested-by.
> 
> Will do. I'll let you know how it goes.

Would not these two patches be relevant for the kernel headers too:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=da360299b6734135a5f66d7db458dcc7801c826a
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6926e041a8920c8ec27e4e155efa760aa01551fd

which would not require patching ebtables or musl at all?
-- 
Florian
