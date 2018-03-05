From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 4 Mar 2018 19:11:10 -0600
Subject: [Buildroot] Defconfigs failing to build with gcc 6.x
In-Reply-To: <CAOMZO5Dy61MpiKuD-ExCj+OQA0RRT=3x=BhuB2rWub71uM9TEw@mail.gmail.com>
References: <20180304224808.566fa00d@windsurf.home>
 <CAOMZO5DXmGWSbfE9PEp+srYkM8ieMX0NYOmyOgza0cuSHsjr9A@mail.gmail.com>
 <CAOMZO5Dy61MpiKuD-ExCj+OQA0RRT=3x=BhuB2rWub71uM9TEw@mail.gmail.com>
Message-ID: <CANQCQpYVgMa4QfBMMFh9=fiGjYr8xF712a9Kyn7vGnoZUDPNcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio,

On Sun, Mar 4, 2018 at 5:53 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Thomas,
>
> On Sun, Mar 4, 2018 at 8:29 PM, Fabio Estevam <festevam@gmail.com> wrote:
>> Hi Thomas,
>>
>> On Sun, Mar 4, 2018 at 6:48 PM, Thomas Petazzoni
>> <thomas.petazzoni@bootlin.com> wrote:
>>
>>>  - freescale_p1010rdb_pa_defconfig
>>>
>>>    https://gitlab.com/buildroot.org/buildroot/-/jobs/55306827
>>>
>>>    Gustavo was taking care of this board. I'm adding Fabio (Estevam)
>>>    from Freescale/NXP as a replacement, in case he is
>>>    interested. Fabio (Estevam): let me know if you're interested. If
>>>    not, we'll remove this defconfig.
>>
>> I don't have access to this board, but I can try to bump the kernel to
>> 4.15.7 and see if it builds fine.
>
> I was not able to find a suitable defconfig for this board in mainline.
>
> As I am not familiar with the PowerPC devices I don't think I will be
> in a good position to maintain this defconfig.
>
> So unless someone is interested in maintaining p1010rdb, I think we
> can remove it.

I'd be all for removing and replacing it with a config for p1025twr.
I can put together a patchset for that one and a t1040d4.

Matt
