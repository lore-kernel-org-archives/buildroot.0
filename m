From: Charles Manning <cdhmanning@gmail.com>
Date: Mon, 3 Dec 2012 11:42:22 +1300
Subject: [Buildroot] Problem building libglib2
In-Reply-To: <50B87033.7090609@mind.be>
References: <CAE21AQquyvDfegH5f8FebeE8LFTnOY3r75Yuy6ZpWs72uD80MQ@mail.gmail.com>
 <20121130001154.129b9238@skate> <50B87033.7090609@mind.be>
Message-ID: <201212031142.22665.manningc2@actrix.gen.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 30 November 2012 21:37:07 Arnout Vandecappelle wrote:
> On 30/11/12 00:11, Thomas Petazzoni wrote:
> > Dear Arnout Vandecappelle,
> >
> > On Thu, 29 Nov 2012 21:27:56 +0100, Arnout Vandecappelle wrote:
> >>    We could obviously solve this by unexporting PKG_CONFIG_SYSROOT_DIR,
> >> but perhaps the better approach is to remove those environment variables
> >> from our custom pkgconf?
> >
> > No, we use PKG_CONFIG_SYSROOT_DIR="/" when we build packages for the
> > host, so we can't simply remove support for the PKG_CONFIG_SYSROOT_DIR
> > environment variable. Unexporting PKG_CONFIG_SYSROOT_DIR sounds like
> > the good solution here.
>
>   Right.
>
>   Charles, would you care to prepare a patch that unexports
> PKG_CONFIG_SYSROOT_DIR and test it in your angstrom environment?

This works and I have submitted a patch.

Thanks

-- Charles
