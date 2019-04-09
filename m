From: Christian Stewart <christian@paral.in>
Date: Mon, 8 Apr 2019 20:22:17 -0700
Subject: [Buildroot] [PATCH 1/1] pkg-golang: Allow per package/target
 CGO_ENABLED setting
In-Reply-To: <CABa6e=oAUccKG8mQh4NCZx6Oq6swgQZMCE7atN4Xeb0s3EcqXg@mail.gmail.com>
References: <20180727024720.13370-1-camh@xdna.net> <20190407214941.GA3117@jaya>
 <87pnpxfe8b.fsf@paral.in> <20190408090458.49e1e5cc@windsurf>
 <CABa6e=oAUccKG8mQh4NCZx6Oq6swgQZMCE7atN4Xeb0s3EcqXg@mail.gmail.com>
Message-ID: <CA+h8R2rAOmstP8C1yni+MBzRhm9FbT66Vfy+SYRKG91j8JRJqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam,

On Mon, Apr 8, 2019, 5:22 PM Cam Hutchison <camh@xdna.net> wrote:

> But never mind. I can maintain this patch in my local buildroot patch
> queue. I just thought it might be useful for others.
>

Rejected doesn't mean rejected permanently, just rejected as is. This means
that more information is needed in the commit message, or maybe something
should be changed in the commit itself.

Fwiw, I'm also integrating kubernetes with buildroot at the moment. I don't
see where cgo is required in this way.

I'd be happy to compare notes if you'd like?

Best,
Christian

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190408/fd2b9731/attachment-0001.html>
