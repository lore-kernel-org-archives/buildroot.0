From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 2 Aug 2013 14:11:29 -0700
Subject: [Buildroot] Using the new Ti-gfx with Qt5
In-Reply-To: <20130802154959.0afcce05@skate>
References: <CALo-6+jacTWNK9aO4FFCUDAyNtSED5wy3q+hMSvFWM3Jciafdw@mail.gmail.com>
 <20130801073520.622bf499@skate>
 <CALo-6+gxOM0m2fztO-Xu58Jq0mhZKgqC-2uj_M27Ooy242vfPA@mail.gmail.com>
 <321768C95D21724485BCE784F1BE98473EB85D97@DBDE04.ent.ti.com>
 <CALo-6+h4oqehKotTEC3jGLpFXtsRCHCEjrbDJxQ=tyrK0xYCig@mail.gmail.com>
 <20130802154959.0afcce05@skate>
Message-ID: <CALo-6+hiCTL53XB2Ho4SD69kfsq0rXcD51qP6wP5xPKFFBZeow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was able to get a successful compile with 3.9, so the next step is
testing on the AM3517 hardware. Thank you all for the advice. I'll
keep you posted.

Charles

On 8/2/13, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Dear Charles Krinke,
>
> On Fri, 2 Aug 2013 06:38:44 -0700, Charles Krinke wrote:
>
>> I am not on any kernel, but rather am trying to find a recipe that
>> will allow ti-gfx to successfully compile. The 3.10 kernel is merely
>> the default option when the arago toolchain is selected.
>
> No, that doesn't make any sense. Selecting the Arago toolchain does not
> select the kernel or any particular kernel version.
>
>> I think we can make progress if we had a default, known working
>> .config for buildroot for the AM3517 with Qt5 and ti-gfx with
>> *whatever* kernel TI feels comfortable with.
>
> I've used kernel 3.9.2 successfully with those ti-gfx drivers just a
> month ago.
>
>> Can someone at TI provide a default, known working .config for
>> buildroot? This is not the .config for the kernel, but rather for
>> buildroot. For the kernel, I assume TI recommends "omap2_plus".
>>
>> Perhaps as some other boards and variations have a readme.txt or
>> default configuration in buildroot's board directory, it might be to
>> our advantage to have such a file or files for TI's 356X and 3517
>> SOC's and their respective reference designs from LogicPD and others.
>
> The problem we have is that the Buildroot defconfig are normally here
> to generate a minimal system, i.e just bootloader+kernel+busybox. We
> have been discussing how to include more defconfig that provide more
> features, but we haven't really reached a consensus yet on how to do
> that.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>


-- 
Charles Krinke
