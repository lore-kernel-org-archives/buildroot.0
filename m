From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Tue, 29 Mar 2016 13:29:59 +0200
Subject: [Buildroot] [initscripts] Default script /etc/init.d/S40network
In-Reply-To: <87d1qd8s1d.fsf@dell.be.48ers.dk>
References: <CALtfCQbJOpzar6wAmdaXzp2U7ZGLSxiZKB6yd4s_xyxxWO5fxg@mail.gmail.com>
 <87d1qd8s1d.fsf@dell.be.48ers.dk>
Message-ID: <CALtfCQZ3Q-AdDwwVZUZO0cUMUpu-Sp8wZPmgosFnh09x5+7RaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, you are right. Thank you

Oscar Gomez Fuente

On 29 March 2016 at 13:03, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "?scar" == ?scar G?mez Fuente <oscargomezf@gmail.com> writes:
>
>  > Hi,
>  > I'm building a buildroot platform with raspberry pi Compute Module. I'm
>  > using Init system BusyBox and the package initscrpts is selected
>  > automatically.
>
>  > The problem is this package has the S40network script, but the RPi
> compute
>  > module doesn't have ethernet, so I think this script has to be deleted
> for
>  > RPi compute module, doesn't it?
>
> No, why do you think that? S40network is still needed to configure the
> loopback interface (127.0.0.1).
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160329/f1c3b79d/attachment.html>
