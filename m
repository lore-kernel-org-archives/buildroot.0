From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sat, 20 Aug 2016 19:33:51 -0400
Subject: [Buildroot] pointer dereference to incomplete type
	vm_operations_struct
In-Reply-To: <20160820195951.61167f14@free-electrons.com>
References: <CAK7rcp9RQO8gfsqc6SAyFpn=kK19iRrS=ckYvnSWJuutc_SE3g@mail.gmail.com>
 <20160820195951.61167f14@free-electrons.com>
Message-ID: <CAK7rcp_a4y28wwPVRBAPqLOFL2_OieUj36um84ZHsJmZsc=3Eg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't have the particular machine at hand in order to provide those.
I hope to be able to provide you those things first thing Monday.

On Sat, Aug 20, 2016 at 1:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 20 Aug 2016 13:03:09 -0400, Kenneth Adam Miller wrote:
>
>> I'm trying to compile a small linux, and I'm getting an error
>> sometimes with vm_operations_struct as per the email title. Is there
>> some kernel option that I'm missing or forgetting to enable? I did a
>> make clean and was sure to delete my build and target directories. But
>> I still get that error. Is there some option that I'm missing that
>> must be set?
>
> Please be more specific:
>
>  - Which kernel version you're using.
>  - Which kernel configuration you're using.
>  - Which exact error message you're getting.
>
> However, most likely the issue you're seeing is not Buildroot related,
> but kernel related.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
