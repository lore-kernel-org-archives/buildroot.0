From: Martin Bark <martin@barkynet.com>
Date: Wed, 8 Nov 2017 11:27:46 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 9.0.0
In-Reply-To: <87efpauwm2.fsf@dell.be.48ers.dk>
References: <20171106102049.14681-1-martin@barkynet.com>
 <87k1z3y5f8.fsf@dell.be.48ers.dk>
 <CAFGQKxdp473snHnkzeCmNUhXjHXE51gEZ7v6nWmLo6YhW5pM+w@mail.gmail.com>
 <87bmkfy1cy.fsf@dell.be.48ers.dk>
 <CAFGQKxdgGc4wSLa5uoTTz7Qt5_D9FPhucEQkyS1Pi+pHinLbtg@mail.gmail.com>
 <87efpauwm2.fsf@dell.be.48ers.dk>
Message-ID: <CAFGQKxefjkOi5ODcX0JZQduKRV7kVj+t1HqSKGtD4xCS1bt-pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 7 November 2017 at 12:00, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:
>
> Hi,
>
>  >> Do these odd non-LTS releases bring a lot of new features making it
>  >> worth the extra effort?
>  >>
>
>  > They can do, it varies.  It really just depends what major changes are
>  > queued up.  Major releases can include breaking changes e.g. API changes
>
> Correct.
>
>  > I can see arguments for following only LTS, only latest or both.  I
> guess
>  > all i need is a final decision to be made.
>
> I think we should at least do it for the LTS releases (E.G. now).
>
> I don't know much about nodejs. What do other distibutions / build
> systems do? We already have precedent in E.G. the gtk/freedesktop stack
> (gtk/glib/gstreamer/..) where we don't package the uneven (development)
> versions.
>

Frankly most distros and build systems seem to do a terrible job of keep
packages like nodejs up to date.  It's common to not use the packaged
version and instead use an program like nvm (node version manager) to
install a local copy similar to rvm for ruby.

archlinux is one of the few distos I've found that does it well. Just like
buildroot it too uses shared libs instead of the bundled libs included in
nodejs.  It updates frequently but since it's a rolling distro it always
tracks the latest nodejs version.


>
>  > We don't have to solve this right now.  How about i submit an 8.9.0
> patch.
>
> Yes, please!
>

I've just submitted a new patch for version 8.9.1 and changed this patch's
state to superseded.

Thanks

Martin


>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171108/53995c11/attachment.html>
