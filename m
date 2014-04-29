From: Mike Zick <minimod@morethan.org>
Date: Tue, 29 Apr 2014 08:21:20 -0500
Subject: [Buildroot] mail list details
In-Reply-To: <CAAXf6LUX2p1DnyZjyzZhJE1DjnRX9oeSDTP03h8t27EY30gMpw@mail.gmail.com>
References: <5e9a4c7fa18c7e6418033c8468ac0679@paravisioner.com>
 <CAAXf6LUX2p1DnyZjyzZhJE1DjnRX9oeSDTP03h8t27EY30gMpw@mail.gmail.com>
Message-ID: <20140429082120.12127082@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 29 Apr 2014 14:09:00 +0200
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> Hi,
> 
> 
> On Tue, Apr 29, 2014 at 1:44 PM, Parsa Panahi
> <panahi.parsa@paravisioner.com> wrote:
> > Hi I want to become familiar with buildroot daily mails which comes
> > to me everyday.
> >
> > I receive many emails in this format that is changing some packages
> > with some config file. for example the following is about a change
> > to opencv package to support qt5.. but I don't know how to apply it
> > to my config file, so it become updated ...
> >

If you only want to apply patches which have been reviewed -

Then select only those messages with the tag: [git commit] added
to the title line.

You can also simply update ('git pull') your local copy of the
repository after seeing the '[git commit]' tagged messages.

Other messages on this list are **proposed** patches, usually
still under discussion and review.
Those are **not** in the repository (yet), some never will be.

Those patch messages are of interest only to those who want to
participate in the review and testing process.

See also the following:

> >
> 
> What is sent on the list are 'patches'. A patch is a set of lines
> representing a change to the code. See also
> http://en.wikipedia.org/wiki/Patch_%28Unix%29
> 
> The typical way to start is to use a git repository and clone the
> buildroot sources. Patches can then be applied using 'git am', or
> using the standard 'patch' utility (git is recommended).
> See http://nightly.buildroot.org/manual.html#getting-buildroot and
> http://nightly.buildroot.org/manual.html#apply-patches-patchwork for
> some details.
> 
> Best regards,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
