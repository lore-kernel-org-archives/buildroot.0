From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 01 Jul 2014 18:03:16 -0300
Subject: [Buildroot] [PATCH 00/10] Proposals of deprecation/removal,
 mainly affecting toolchain
In-Reply-To: <20140701224916.0a11ba13@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>	<53B3073B.8090005@zacarias.com.ar>	<20140701221326.3ca5279f@free-electrons.com>	<53B31C82.6070608@zacarias.com.ar>
 <20140701224916.0a11ba13@free-electrons.com>
Message-ID: <53B32214.2070009@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/2014 05:49 PM, Thomas Petazzoni wrote:

> I've got some hardware here, so I could do some testing. On the
> Blackfin side, I continue to remain highly disappointed by the lack of
> help/support from ADI, despite the numerous requests I made to them,
> and the fact that they use Buildroot as their official build system.

This ^ i had in mind when writing about upstream help.
And them doing patches that just switch fork() with vfork() without any
proper context, which will make things build but never work in a
proper/how they were intended way.

> Hopefully this is the type of issues that will get resolved with 4.9.1
> or 4.9.2.

Yes, build breakage mostly so i'd expect the same.

> I don't know. Which architectures are in this situation right now?
> AVR32 for sure. Blackfin is also an architecture for which we don't
> have a lot of contribution from either ADI or direct Blackfin users.
> Any other architecture? We can't expect for all architectures to have
> direct upstream collaboration, not all companies necessarily care about
> Buildroot.

Well going back to the first point, if they don't care and use it like
ADI that's shortsightedness to me.
As always if they upstream their stuff then most of the time they don't
need to care.
Regarding noMMU, blackfin may indirectly benefit from ARM Cortex-M if it
picks up pace - i.e. more people working at solving issues with it.
Regards.
