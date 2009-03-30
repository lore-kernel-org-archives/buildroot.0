From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 30 Mar 2009 13:39:04 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils
	external-toolchain gcc uClibc
In-Reply-To: <20090330175842.1960fed2@surf>
References: <20090130162827.2A05D765E9@busybox.osuosl.org>
	<20090330153259.0a7ee398@surf> <87ab73azsj.fsf@macbook.be.48ers.dk>
	<20090330175842.1960fed2@surf>
Message-ID: <d6cda7730903300939u12cbb6c6md954983fa64fe691@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Mar 30, 2009 at 12:58 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> Now, the current approach is certainly nice from a maitenance POV as
>> there's only one set of options so they are always in sync, but I
>> agree that it isn't that userfriendly.
>
> The best option would be to compute automatically these configuration
> options when using an external toolchain. But I don't see how this can
> be done with how the kconfig system works.

Perhaps if you could make a script that probes those values, it could
be called before kconfig in menuconfig target and set it before hand.

Just an idea.

Kind Regards,
   Thiago A. Correa
