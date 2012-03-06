From: Mohamed HAMZAOUI <requinham@gmail.com>
Date: Tue, 6 Mar 2012 10:19:57 +0100
Subject: [Buildroot] [U-Boot] Craneboard with Uboot and xloader
In-Reply-To: <4F550BC3.80601@ti.com>
References: <CABMxt4ic6cZ_xfrtkouKkw2OWSbOiL95tXrz9XgKyqUAd4U-6A@mail.gmail.com>
 <20120224150232.GA2346@bill-the-cat>
 <CABMxt4hMc3CjnjFEQNTjzsfxyXgBoyO8uMg1xsmaTeZ2pWXRRQ@mail.gmail.com>
 <CA+M6bXk7yKi8VFQRbYT-SQZMwM9eneBzjx2NB9KpHeicxkDb9Q@mail.gmail.com>
 <CABMxt4ja3EmjER5ywn5R+OLxkXy-Ho-cZ89LLuML4qX50ews=w@mail.gmail.com>
 <CA+M6bX=A1Mie8Q093Sa3bp_hSxSRFR6z4-sNBvJP3982e_HPqQ@mail.gmail.com>
 <CABMxt4gYMf_JjfYi_2YttUL2NDNYC4974Kq_--++B2yPgf0xUg@mail.gmail.com>
 <CA+M6bXktYKXisQEiS11CNixozV7KtzwajKsXyTPNXSEOjxz3AA@mail.gmail.com>
 <CABMxt4hoihH2pJk5GZ6hpt0K3Vm_Qzg8eL1ej-bFH67DOSNUqA@mail.gmail.com>
 <CABMxt4jZhMcZS=0P9Le3ZHO_NUJJt0Deta_Ybdd-ghdPPuGz2A@mail.gmail.com>
 <CA+M6bXnNxFhzQpDOQhuSM7VKEh41dazMmUeEv=VTdVUuNoQhAw@mail.gmail.com>
 <CABMxt4ixVGvV_LvduJSNmWevxiEvFv0GdRHpomK325bKp4T20A@mail.gmail.com>
 <4F550BC3.80601@ti.com>
Message-ID: <CABMxt4g9Xm6=QPhH1U2oDKVbXNjnPaxq_y71pUS4WF2LUG1RSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

So far I have not been able to compile another kernel version other than (
https://github.com/craneboard/craneboard-kernel.git) with buildroot. This
poses for Craneboard users a lot of trouble since we can never build any
tools that require newer versions as qt 4.7.4
I think the least we can do is update the wiki by integrating information
on :
- how to adapt a vanilla kernel to be compilable and particularly with
buildroot
for Craneboard (list at least patch)
- how to enable the graphical display via dvi and what is the maximum
resolution (it's odd that we found this in the forum and not in the wiki og
IT !)

If you want I can do this for you (it only takes a little time) but give me,
please, all necessary informations.

Thanks
Mohamed

On Mon, Mar 5, 2012 at 7:53 PM, Tom Rini <trini@ti.com> wrote:

> On 02/28/2012 06:45 AM, Mohamed HAMZAOUI wrote:
>
>> Hi Mr Tom,
>>
>> Ok, i will create a patch for this and i will send it to you for check it.
>>
>> Can you please tell me the problem with booting !
>> After compiling a new compilation with Buildroot and with kernel
>> 2.6.39.4 on Craneboard, i have a strange problem in booting the kernel
>> "Kernel panic...".
>>
>
> Are you using the TI kernels?  Otherwise currently the board doesn't work
> (people are working to address this, however).
>
> --
> Tom
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120306/ed1a3e07/attachment.html>
