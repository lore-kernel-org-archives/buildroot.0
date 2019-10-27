From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 01:57:18 -0500
Subject: [Buildroot] [PATCH v2 1/1] check-package: add version format
 check
In-Reply-To: <20191026155754.38eade84@windsurf.home>
References: <20191025092104.1164-1-heiko.thiery@gmail.com>
 <20191026155754.38eade84@windsurf.home>
Message-ID: <CANQCQpa_Z9SeM7dyp7MethO=ZEf23AT-=a_4jbLPhfq--VjaLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, Thomas,

On Sat, Oct 26, 2019 at 8:58 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Heiko,
>
> On Fri, 25 Oct 2019 11:21:04 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > From: Heiko Thiery <heiko.thiery@kontron.com>
> >
> > To meet the requirement of "Anitya", the tool used by
> > https://release-monitoring.org/, the <pkg>_VERSION variable
> > should not contain a prefix 'v'.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
>
> The implementation looks good, but we cannot apply this patch now,
> because a number of packages cause this check to fail:
>

I've sent all but the GIT site method pkgs (mcelog / dt-utils /
gst1-shark / linux-zigbee) as I need to find an example or look at the
pkg logic to see how we're updating those.

Regards,
Matt
