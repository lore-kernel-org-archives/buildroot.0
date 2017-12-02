From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 2 Dec 2017 16:49:22 +0100
Subject: [Buildroot] [PATCH 1/1] webp: add mandatory host-pkgconf
 dependency
In-Reply-To: <20171202152442.6beda8c1@windsurf.lan>
References: <20171202141157.12840-1-fontaine.fabrice@gmail.com>
 <20171202152442.6beda8c1@windsurf.lan>
Message-ID: <CAPi7W81B2iRSEvD_DF2=nFt9J_e-yz=7SE6vgvB9sHx0hgCE1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

2017-12-02 15:24 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sat,  2 Dec 2017 15:11:57 +0100, Fabrice Fontaine wrote:
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Could you give a few more details here? From a quick grep in the webp
> code, I don't see PKG_CHECK_MODULES() used anywhere, not pkg-config
> used. I quite probably missed it, but if it's not obvious, a slightly
> more verbose commit log would be nice.
>
My bad, this is a mistake, I saw that there was a pkgconfigdir option but
it is not used to find packages but to install webp files.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171202/8af32676/attachment.html>
