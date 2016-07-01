From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 1 Jul 2016 18:40:02 +0200
Subject: [Buildroot] [PATCH v2 2/3] gcc: consolidate fortran options
In-Reply-To: <20160318202342.GA23907@spaceflight.com>
References: <20160318202342.GA23907@spaceflight.com>
Message-ID: <CAHXCMMJ=skNTCJ63C7msaBGn_801aozB1aG4+mXwe9NSrRgMTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benjamin,

On Fri, Mar 18, 2016 at 9:23 PM, Benjamin Kamath <kamath.ben@gmail.com> wrote:
> Have BR2_TOOLCHAIN_BUILDROOT_FORTRAN select BR2_INSTALL_LIBFORTAN,
> allowing packages and other dependencies to generically check
> for fortran support with buildroot and external toolchains.
>
> Signed-off-by: Benjamin Kamath <bkamath@spaceflight.com>

I have just reposted an updated of the fortran series which includes
your changes [1].
So, these patches (from May) will be marked as superseded in the
Buildroot patchwork.

[1] http://lists.busybox.net/pipermail/buildroot/2016-July/165662.html

Regards,

-- 
Samuel
