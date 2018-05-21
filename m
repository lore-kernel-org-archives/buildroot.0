From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 21 May 2018 15:30:27 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-25
In-Reply-To: <CANQCQpbJpXiXFYQ9Jo=cbnNR_3n0tfMpv6hmXy=5Na-r5MnOzg@mail.gmail.com>
References: <20180426060013.EAB262079F@mail.bootlin.com>
 <18cd8156-03bc-05cf-5343-dec77dbf01a9@gmail.com>
 <20180430091509.3a9cdff2@windsurf>
 <cab2ab99-f53c-448f-7cdb-77456a189664@smile.fr>
 <56ce1d9d-7b2a-1cda-52e3-a01094e6713a@gmail.com>
 <CANQCQpZzeALsKx7GFMUD_jSSn+=YS9KZBoOeuf7dUR8Um1pJDQ@mail.gmail.com>
 <87zi0unjn5.fsf@dell.be.48ers.dk>
 <CANQCQpaJZaMHUjskdyeb4tbWMtkghBtctgnm696bVsct1m=vkw@mail.gmail.com>
 <871se4khgv.fsf@dell.be.48ers.dk>
 <CANQCQpbJpXiXFYQ9Jo=cbnNR_3n0tfMpv6hmXy=5Na-r5MnOzg@mail.gmail.com>
Message-ID: <CANQCQpauCz+9rbEBRF=+AyzqizgwdHdWfnR-M1UMNSCyAGRerg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Mon, May 21, 2018 at 1:21 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Peter,
>
> On Mon, May 21, 2018 at 1:10 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>>
>> Hi,
>>
>>  >> Hmm, I don't really feel confident adding patches that upstream find too
>>  >> scary. What is the alternative? Does this only affect libnss on
>>  >> Microblaze?
>>
>>  > Correct, only libnss on Microblaze.  Romain had suggested adding a GCC
>>  > bug for it instead.  (ie  like BR2_TOOLCHAIN_HAS_GCC_BUG_64735)
>>
>> I think that is the best solution, yes. libnss luckily does not have a
>> lot of reverse dependencies.
>>

http://patchwork.ozlabs.org/patch/917842/
