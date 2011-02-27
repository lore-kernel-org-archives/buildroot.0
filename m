From: Steve Johnson <sjohnson228@gmail.com>
Date: Sun, 27 Feb 2011 14:40:37 -0800
Subject: [Buildroot] Question about buildroot generated toolchain
	binaries
In-Reply-To: <AANLkTi=4GCSBMgvC6M8Dh0LrpOdpOOX2J+jk6+3X5tOo@mail.gmail.com>
References: <AANLkTikLie3Zj9hqYV=BvGEN+efJm0_eVKWbc-66L3wt@mail.gmail.com>
	<AANLkTi=4GCSBMgvC6M8Dh0LrpOdpOOX2J+jk6+3X5tOo@mail.gmail.com>
Message-ID: <AANLkTin5E0ig9oa0m-=L-xd-eg-QoeA9xOREO2mwBYEP@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles,

Actually, there are two copies of gcc:

one in /usr/arm-linux/bin:

-rwxr-xr-x. 1 na na  252289 Feb 21 20:10 gcc

and one in /usr/bin:

-rwxr-xr-x.  2 na na  252289 Feb 21 20:10 arm-unknown-linux-uclibcgnueabi-gcc

Thanks

On Fri, Feb 25, 2011 at 7:43 AM, Charles Krinke
<charles.krinke@gmail.com> wrote:
> Dear Steve:
>
> I suspect you will find that only one set exists and the others are all
> soft-links to the *real* set.
>
> This has to do with name expectations of various software using those
> binaries, but I believe there is only one set.
>
> Charles
>
> On Thu, Feb 24, 2011 at 5:54 PM, Steve Johnson <sjohnson228@gmail.com>
> wrote:
>>
>> Hi,
>>
>> In my toolchain output directory I seem to have
>> multiple copies of the same binaries..
>> In directory /usr/bin I have the gcc compiler (and other binaries) and in
>> directory /usr/arm-linux/bin I also have gcc? Why is that?
>>
>>
>> Thanks,
>>
>> Steve
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
> Charles Krinke
>
>
>
