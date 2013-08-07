From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Aug 2013 18:01:25 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <20130807172033.564940d1@skate>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <20130806195402.2f3f94e7@skate>
 <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
 <CAAXf6LWF=7-cP_=mTRjNK1qki-gxKx+BoR1C_1Bw9QGUUtstmA@mail.gmail.com>
 <20130807172033.564940d1@skate>
Message-ID: <CAAXf6LVT144yhgAh5ce5O9FjR=osQ=qV=sod=-pDSOiqeRTvuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Aug 7, 2013 at 5:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 7 Aug 2013 09:05:30 +0200, Thomas De Schampheleire wrote:
>
>> I can now confirm that the atngw100_defconfig works unchanged, but
>
> Does the 3.10 kernel builds for you? It fails to build for me with some
> truncated relocation messages. I.e, as is, the atngw100_defconfig
> doesn't build here.

What I meant was the toolchain part. I also had the kernel problems.

>
>> when I enable C++ support in the toolchain, host-gcc-final fails with
>> the aforementioned error about truncated relocations.
>>
>> I'm not sure how to proceed from here...
>
> Can you try to see if the same configuration was building in the
> 2013.05, to see if the problem is a consequence of the new internal
> toolchain backend or not?

I will, and let you know the results.

Best regards,
Thomas
