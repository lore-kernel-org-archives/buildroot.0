From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 20:57:07 +0200
Subject: [Buildroot] [PATCH] libtomcrypt: bump to version 1.18.0-rc1
In-Reply-To: <CAB0FRstL5wU2_8smT2LPx9Xv9uBhmJQNax_paLH=u4H43kGt_g@mail.gmail.com>
References: <20170706175456.11742-1-francois.perrad@gadz.org>
 <20170706202526.365ec65c@windsurf.lan>
 <CAB0FRstL5wU2_8smT2LPx9Xv9uBhmJQNax_paLH=u4H43kGt_g@mail.gmail.com>
Message-ID: <20170706205707.6402f1e3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Jul 2017 20:45:35 +0200, Fran?ois Perrad wrote:

> > Why would we upgrade to a release candidate version?
> >
> It's a good way to test it (with autobuilder).

Buildroot is not really meant to test release candidates of upstream
packages, especially when the final release is unlikely to be released
before the next Buildroot release will be cut.

> Note: in BR, many packages use a Git hash commit as version/tag.

And every time because there's a good reason: no stable release at all,
or the last stable release has some issue that cannot be fixed by just
backporting a few patches.

Here there are no issues, and you propose to bump to a release
candidate. I really don't think we want to do this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
