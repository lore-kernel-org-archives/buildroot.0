From: John Voltz <john.voltz@gmail.com>
Date: Thu, 24 Apr 2008 10:36:54 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7:
	xapp_xclock xkeyboard-config xserver_xor etc...
In-Reply-To: <87iqy75pje.fsf@macbook.be.48ers.dk>
References: <20080424132214.B024D3C858@busybox.net>
	<87iqy75pje.fsf@macbook.be.48ers.dk>
Message-ID: <46a136670804240736t206b2875g7f5acdefd7be15fe@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added support for tslib in xserver .
Ubuntu has a problem finding gmsgfmt when building xkeyboard.
And xclock needs to link with libiconv.

On Thu, Apr 24, 2008 at 9:51 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:
>
>  ninevoltz> Author: ninevoltz
>  ninevoltz> Date: 2008-04-24 06:22:14 -0700 (Thu, 24 Apr 2008)
>  ninevoltz> New Revision: 21836
>
>  ninevoltz> Log:
>  ninevoltz> some fixes for X
>
> Could you be more specific in your commit messages? What have you
> fixed and why?
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/b733db96/attachment-0001.htm 
