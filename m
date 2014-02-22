From: Martin Bark <martin@barkynet.com>
Date: Sat, 22 Feb 2014 12:54:15 +0000
Subject: [Buildroot] [PATCH 1/2] tvheadend: fix error compiling with
	ccache
In-Reply-To: <87bny0uqc4.fsf@dell.be.48ers.dk>
References: <1392989961-18289-1-git-send-email-martin@barkynet.com>
 <87bny0uqc4.fsf@dell.be.48ers.dk>
Message-ID: <53089DF7.1010102@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On 21/02/14 21:07, Peter Korsgaard wrote:
>>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:
>
>   > The tvheadend configure script fails to correctly handle spaces in any of
>   > the options passed to it.  If ccache is used the configure script fails to
>   > handle the space in the --cc option and errors.  Also the --cflags option
>   > fails to handle multiple entries and only uses the first one.  This patch
>   > simple removes setting the --cc and --cflags options as the configure
>   > script will correctly use the CC and CFLAGS variables already passed in
>   > TARGET_CONFIGURE_OPTS.
>
>   > Signed-off-by: Martin Bark <martin@barkynet.com>
>   > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>
> Committed, thanks.
>
> Is there supposed to be a patch 2/2 somewhere?
>

Thanks.  I was going to submit a 2nd patch to bump the version but then 
decided against it because i got confused.  The tvheadend version 
numbers seem a mess.

Martin
