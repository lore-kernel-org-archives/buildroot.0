From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Fri, 28 Aug 2015 13:54:54 -0700
Subject: [Buildroot] [PATCH] kconfig: support read-only Buildroot source
 directories
In-Reply-To: <CAK4VdL1O23q7Q1Fs9SjWZCRpxC-34qn1_j0gEVeBPwYHbeMgaA@mail.gmail.com>
References: <1439504572-20085-1-git-send-email-hollis_blanchard@mentor.com>	<20150817225329.6b4e8453@free-electrons.com>
 <CAK4VdL1O23q7Q1Fs9SjWZCRpxC-34qn1_j0gEVeBPwYHbeMgaA@mail.gmail.com>
Message-ID: <55E0CA9E.4060304@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's on my list, but I don't expect to be able to get back to this for 
quite a while. Sorry!

Hollis Blanchard
Mentor Graphics Emulation Division

On 08/28/2015 12:35 PM, Erico Nunes wrote:
> Hello all,
>
> This bug seems to be somewhat major to remain in the 2015.08 release,
> as it prevents users from using a read-only buildroot source with
> out-of-tree builds.
>
> On Mon, Aug 17, 2015 at 5:53 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Thanks for this patch! It looks good in principle, but is not done
>> correctly. support/kconfig/ is directly inherited from the kernel
>> source code, and we keep a series of patches in
>> support/kconfig/patches/ to clearly identify the changes we made
>> compared to the original kernel version. See
>> support/kconfig/README.buildroot for details.
>>
>> Could you rework your patch to also add a patch to
>> support/kconfig/patches/ ? Can you check whether the problem also
>> exists in the kernel kconfig code, and if so, report the problem to the
>> kernel developers ?
>>
> Hollis, did you manage to evolve this issue with the kernel developers?
> Or, will you have time to work this patch before the release according
> to Thomas' review?
> I believe it would be a very important fix, and I could pick it in
> case you are unable right now.
>
> Thanks,
>
> Erico
