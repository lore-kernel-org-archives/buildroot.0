From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 30 Mar 2009 16:56:54 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils
	external-toolchain gcc uClibc
In-Reply-To: <87prfyald1.fsf@macbook.be.48ers.dk>
References: <20090130162827.2A05D765E9@busybox.osuosl.org>
	<20090330153259.0a7ee398@surf> <87ab73azsj.fsf@macbook.be.48ers.dk>
	<20090330175842.1960fed2@surf> <87prfyald1.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730903301256r2e9adf8bmf613118daf62eb61@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Mar 30, 2009 at 3:58 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> Hi,
>
> ?>> Now, the current approach is certainly nice from a maitenance POV as
> ?>> there's only one set of options so they are always in sync, but I
> ?>> agree that it isn't that userfriendly.
>
> ?Thomas> The best option would be to compute automatically these
> ?Thomas> configuration options when using an external toolchain. But I
> ?Thomas> don't see how this can be done with how the kconfig system
> ?Thomas> works.
>
> Not without running some kind of configure script to append Kconfig
> settins when you're using an external toolchain. I don't quite know
> how to integrate this nicely though.
>


Would that be a bad thing? Even if it's not integrated but a script, say:
./script/fix-external-toolchain.sh

Before/after running kconfig.

It beats having the user to guess or remember.

Kind Regards,
   Thiago A. Correa
