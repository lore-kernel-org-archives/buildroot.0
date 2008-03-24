From: John Voltz <john.voltz@gmail.com>
Date: Mon, 24 Mar 2008 07:37:11 -0400
Subject: [Buildroot] rpm & buildroot
In-Reply-To: <1206355410.3605.5.camel@nigel-x60>
References: <1206343539.3605.1.camel@nigel-x60>
	<46a136670803240332w469c8e59s169b3ba1ccfe2c1e@mail.gmail.com>
	<1206355410.3605.5.camel@nigel-x60>
Message-ID: <46a136670803240437k1bb9234fm7643e2d410ee1c99@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just assume most people use buildroot for embedded devices, but I guess
it's not restricted to that alone :)

Did you try using strace or maybe run it in a gdbserver? I use Eclipse with
the RSE (Remote System Explorer) plugins. You can easily debug over ethernet
this way. I wrote a quick how-to for AVR32 but it will work just the same
for x86.

http://avr32linux.org/twiki/bin/view/Main/RemoteDebugging

John

On Mon, Mar 24, 2008 at 6:43 AM, Nigel Kukard <nkukard@lbsd.net> wrote:

>
> > Why RPM? Busybox has facilities for dpkg, and I added ipkg to
> > buildroot recently too. Isn't RPM a little bit too much of a resource
> > hog for embedded use? I know it would be nice, but is it really
> > practical?
>
> Not for embedded use.
>
> I'm using it for a rescue initramfs for x86's.
>
> Buildroot isn't restricted to embedded use is it?   ;)
>
> -N
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080324/839413ae/attachment.htm 
