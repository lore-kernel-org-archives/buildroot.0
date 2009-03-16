From: T.Y. Lai <d_unno@hotmail.com>
Date: Mon, 16 Mar 2009 16:21:33 +0800
Subject: [Buildroot] Changing the selection of kernel in buildroot
In-Reply-To: <87ab7lrjmu.fsf@macbook.be.48ers.dk>
References: <COL104-W83AF8BEBACE3D5C6708B29EE9B0@phx.gbl>
	<87ab7lrjmu.fsf@macbook.be.48ers.dk>
Message-ID: <COL104-W7087909B192B1EAEBC0814EE9B0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi,
I'm working on RTAI with arm which support kernel is 2.6.20.13 and gcc 3.4.6I did try out the oldest 2006 release with kernel 2.6.12 which i can find on the webIt causes some kernel oops with the release, most probably is the issue on the kernel header while building the toolchain.
Is there any method which i can get my hands on 2.6.20.13 release?else I'll have to give 2009.02 release a shot or roll out my own toolchain.
Thanks!Eric
> To: d_unno at hotmail.com
> CC: buildroot at busybox.net
> Subject: Re: [Buildroot] Changing the selection of kernel in buildroot
> From: jacmet at uclibc.org
> Date: Mon, 16 Mar 2009 08:50:49 +0100
> 
>>>>>> "T" == T Y Lai <d_unno@hotmail.com> writes:
> 
>  T> Hi,
>  T> Is there a method the default kernel selection that is found in buildroot?
> 
>  T> The reason for doing so is due to the reason that I'm looking for 
> 
>  T> kernel 2.6.20.13
>  T> and gcc 3.4.6
> 
> Why do you want to use so ancient versions? The 2009.02 release has
> gcc 3.4.6 and 26.20.20 (when you enable build options -> show packages
> that are deprecated), but they are removed from svn trunk.
> 
> -- 
> Bye, Peter Korsgaard

_________________________________________________________________
NEW! Get Windows Live FREE.
http://www.get.live.com/wl/all
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090316/e06ed22e/attachment.htm>
