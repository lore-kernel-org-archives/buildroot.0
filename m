From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 13 Mar 2015 11:59:31 +0100
Subject: [Buildroot] Changing permission recursively
In-Reply-To: <20150313115358.3241b6a2@free-electrons.com>
References: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
 <20150312175527.GO2177@tarshish> <20150313073131.7a16aeb6@free-electrons.com>
 <CA+TH9V=b-5KdMKQVWkZRZDh31qkKqBTqy+6MdqU3Sr+7wuGFkA@mail.gmail.com>
 <20150313102741.GQ2177@tarshish> <20150313115358.3241b6a2@free-electrons.com>
Message-ID: <CA+TH9Vkam3jGOTvqyLAjUXvwdBtq5ma+SANHjq=LAsMZK_s2Fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-03-13 11:53 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Baruch Siach,
>
> On Fri, 13 Mar 2015 12:27:41 +0200, Baruch Siach wrote:
>
>> Another options is to simply cat a user provided script into
>> $(FAKEROOT_SCRIPT) as part of the rootfs image generation at fs/common.mk.
>
> Yes, this is something that has been proposed in the past.
>
> Back then I think our thinking was: maybe it's a bit complicated for
> normal users to understand the details of the fakeroot thing, and what
> they should put in the custom fakeroot scripts vs. normal post-build
> scripts.

I just proposed my own vision on the problem solution!

Sincerely, Angelo

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
