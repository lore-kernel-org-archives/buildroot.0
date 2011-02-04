From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sat, 5 Feb 2011 00:56:22 +0200
Subject: [Buildroot] [PATCH 1/2] Update to the latest GStreamer packages
In-Reply-To: <8739o3qxmg.fsf@macbook.be.48ers.dk>
References: <1296843913-22321-1-git-send-email-felipe.contreras@gmail.com>
	<1296843913-22321-2-git-send-email-felipe.contreras@gmail.com>
	<8739o3qxmg.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTikNbw8Y9MG8KGgRR6Ztj+9Li1+x4GtNujEjW+Bt@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 4, 2011 at 11:48 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:
>
> ?Felipe> liboil is not needed not used any more. orc _can_ be used instead, but
> ?Felipe> it's not needed.
>
> Committed, thanks. You forgot to remove the select BR2_PACKAGE_LIBOIL,
> but I did that.

It's supposed to be useful outside GStreamer, but I guess nobody
really uses that.

> Just to be sure - With these version bumps the fixes for make 3.82 are
> no longer needed, right?

That's right, they are not needed any more.

-- 
Felipe Contreras
