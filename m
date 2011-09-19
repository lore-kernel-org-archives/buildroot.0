From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 19 Sep 2011 10:54:03 +0200
Subject: [Buildroot] [PATCH 6/8] xenomai: add support to keep or remove
	skins
In-Reply-To: <20110919104937.454ea011@skate>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <84dc08856919e6431347886d30464c89cf61d692.1316290714.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LUzhZ6GXoF1GF++Q0Uet8-=DF2oxeOaWt4fQLxM7KU55g@mail.gmail.com>
 <20110919104937.454ea011@skate>
Message-ID: <CAAXf6LUOuisxF63fzFKBFaE5HdpEgqmOJdNg22XrENLa_6soAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 19, 2011 at 10:49 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Mon, 19 Sep 2011 10:24:27 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Maybe it should be clarified somewhere that this only impacts the
>> inclusion of the userspace skin library. To be able to use a
>> particular skin, you still need to enable it in the kernel
>> configuration.
>
> Yes, correct, I'll add that.

Ok, thanks.

>
>> Or maybe it's better to make these options have impact on the linux
>> configuration as well ?
>
> I don't like too much having packages that interfere with the kernel
> configuration, because it's a nightmare: when iptables is compiled, we
> would need to ensure that kernel support is available, same for
> xfsprogs, for v4l-utils, for input-tools, etc ?
>
> Our policy has been that the user needs to be aware of what (s)he is
> doing, especially when it comes to making sure that the kernel
> configuration appropriately matches the requirement of userspace
> applications and libraries.

I understand. That's fine with me..

Best regards,
Thomas
