From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 8 May 2009 04:59:37 -0300
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <877i0scbjf.fsf@macbook.be.48ers.dk>
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<877i0scbjf.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730905080059o7fa58ba6w3bf66241b0c90bc2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, May 8, 2009 at 4:13 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>
> ?Thiago> Hi Peter,
> ?Thiago> ? ? I'm newbie with this git thing, so please bear with me...
>
> ?Thiago> ? ? Please pull git clone git://git.buildroot.net/~correa/git/buildroot.git for:
>
> ?Thiago> ?* Update Linux Advanced to 2.6.29.2 - this fixes iptables compile
> ?Thiago> ?* Add dl folder to gitignore
> ?Thiago> ?* Update atngw100_defconfig
>
> I had a quick look, and it basically looks good, but there's a few
> things I would like you to fix:
>
> - Please sign off on your fixes (git commit -s)

Can this be done easily after it has been commited? Since I had setup
my name and address, I had hopes that it would do it automagically.

> - Don't commit unrelated things together (Linux advanced together with
> ?atngw100 defconfig)

Ok.

> - What do you mean with 'this fixes iptables compile'? What does the
> ?kernel has to do with iptables compilation?

Something is wrong in the kernel headers in previous versions.
Something in byteorder.h prevended it from building earlier.

> You are welcome to put the fixes for 2009.05 in a seperate branch
> (upstream, stable or whatever) if that's easier for you to keep it
> seperate for new feature development while we're stabilizing for the
> release. I might create a 'next' branch for new stuff.
>

I thought of using master for current and 2009.07 for next. But I
could use a suggestion anyway.

About the .gitignore, I didn't base it from a patch, I actually added
it myself because git was always complaining about it and I had to do
git commit -m "" -a
But feel free to apply a previous patch that does the same. I still
haven't figured out how to do git am stuff :D

Btw, how does one get those nice summaries like this ?
http://lkml.org/lkml/2009/4/4/40


Kind Regards,
   Thiago A. Correa
