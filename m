From: =?ISO-8859-1?Q?Jesper_Birks=F8_B=E6kdahl?= <jbb@gamblify.com>
Date: Tue, 12 Mar 2013 09:52:07 +0100
Subject: [Buildroot] X11 component versions
Message-ID: <CALnvph2VjwKv6U38KpR3JtWozs_zPWDzpu5stGpREuJHcdGw0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys

Nicolas Dechesne <ndec13@...> writes:
>
> On Mon, Feb 4, 2013 at 12:11 PM, Will Wagner <will_wagner@...> wrote:
> > You can find my work on updating to x11r7.7 on gitorious at
> >
https://gitorious.org/willw-buildroot/willw-buildroot/commits/remotes/gitorious/x11r7.7
> >
> > It is now based on a much older buildroot version and needs a lot of
work to
> > update.
>
> thanks. i am starting to look at what you've done (and rebase on
> master). however I don't understand how you came up with the large
> list of 'removed' components [1].
>
> some comments:
>  - why did you remove any of the xapp_xxx components? these one are
> generally not included in the X11 R7.x releases, and are released
> separately. i don't understand why we should remove them from BR
> during a X11 version upgrade
>  - i agree with your list of removed drivers (xdriver_xxx)
>  - I agree that the following components were removed during R7.4 to
> R7.5 migration:
> font-bitstream-speedo-1.0.0.tar.gz
> fontcacheproto-0.1.2.tar.gz
> libXfontcache-1.0.4.tar.gz
>  - for everything else, i don't know why you removed them.
>

I have tried to rebase the x11r7.7 patches on master. I chose not to remove
all app components for the reasons mentioned by Nicolas Dechesne.

As this is my first time contributing to buildroot, I don't know the
procedures when dealing with this many patches at once, so for now I have
just pushed my version of the branch to:
https://bitbucket.org/baekdahl/buildroot/src/b8db03aa6921/?at=x11r77

Hope someone will take a look.

Regards, Jesper
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130312/84d32c98/attachment.html>
