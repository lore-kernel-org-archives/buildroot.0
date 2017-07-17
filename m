From: Martin Bark <martin@barkynet.com>
Date: Mon, 17 Jul 2017 09:43:33 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: use shared c-ares if
	available
In-Reply-To: <20170716091620.11f40d13@windsurf>
References: <1500140309-26534-1-git-send-email-martin@barkynet.com>
 <20170715214447.76763605@windsurf>
 <CAFGQKxe88yf4EMBxWdkpXBaQxyqG2XRaK=fdbA0Tae81MsU-ZA@mail.gmail.com>
 <20170716091620.11f40d13@windsurf>
Message-ID: <CAFGQKxegkLtCdH77_EoNWjpeZgE0OmeHxRySZe9QhoXLAgm4PA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 16 July 2017 at 08:16, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Sun, 16 Jul 2017 00:12:33 +0100, Martin Bark wrote:
>
> > nodejs always uses c-ares, libuv and libhttpparser, it just uses it's own
> > versions by default (see https://github.com/nodejs/node/tree/master/deps
> ).
> > Not setting any options will continue to use the build in versions.
>
> Then in this case, we want nodejs to unconditionally select c-ares,
> libuv and libhttpparser. Indeed, like most distributions, we prefer to
> use the external libraries rather than the built-in ones.
>

Sounds good, i prefer that approach.  I'll resubmit the patches to
unconditionally select the libraries.

Thanks

Martin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170717/1379f39f/attachment.html>
