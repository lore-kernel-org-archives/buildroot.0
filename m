From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 17 Dec 2013 10:32:14 +0100
Subject: [Buildroot] [PATCH 1/1] linux.mk: enable options for ktap
In-Reply-To: <87fvpsqz6b.fsf@dell.be.48ers.dk>
References: <1387191200-20387-1-git-send-email-anders@chargestorm.se>
 <CAAXf6LVOssD-uJP6E3oFRg3DOca7N8sR+PzrBtLZDd=1PVTjVw@mail.gmail.com>
 <20131216144447.GB5876@ad.chargestorm.se>
 <CAAXf6LX8WnxbJp=st28-15_xY54YC2DdhROCsHRq0nAaMj3qUw@mail.gmail.com>
 <87fvpsqz6b.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LU2jXtmVRWSs1kOLhwqqhSHH2sHSrqUkDqmsTqCCYZ4Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 16, 2013 at 10:11 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  >> We've got three options:
>  >>
>  >> 1) Let it be as it is today
>  >> 2) Change the text to state that those options are automatically enabled
>  >> 3) Do as e.g. systemd does, which enables cgroups without mentioning in
>  >> Config.in. I.e. remove the discussion of those options from
>  >> ktap/Config.in.
>  >>
>  >> I'm indifferent to either of these solutions.
>
>  > Let's indeed see what others think, but my opinion:
>  > - it's good that ktap/Config.in mentions the options, so that users
>  > with an external toolchain are notified
>
> I guess you mean 'external kernel'? ktap depends on BR2_LINUX_KERNEL so
> it only works when buildroot builds the kernel.

Yes I did mean that, but forgot that ktap always required a buildroot kernel.

>
>  > - it would be good to reassure users that do have a buildroot-built
>  > kernel that everything is fine for them.
>
> Agreed, I've added a comment explaining that.

Ok, thanks.
Thomas
