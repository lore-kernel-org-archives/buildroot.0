From: Anders Darander <anders@chargestorm.se>
Date: Mon, 9 Dec 2013 19:38:25 +0100
Subject: [Buildroot] [PATCH v2 1/1] ktap: new package
Message-ID: <F9EA2A807ACC1C459AC6ABD87662881C0D9EE58F23@STOEXMBXC04.domain01.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 9 Dec 2013 18:54, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> On Mon, 9 Dec 2013 13:57:09 +0100, Anders Darander wrote:
>
> > +define KTAP_BUILD_CMDS
> > +     $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPT) ktap
>
> Are you sure this works? The variable name is TARGET_CONFIGURE_OPTS.

Hm, yes that sounds strange. I'm parotid that it built correctly, though I guess I'll need to double check that it wasn't before that typo got in.

I guess I'll be back with a v3 tomorrow...

Cheers,
Anders

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131209/f96e9cfc/attachment.html>
