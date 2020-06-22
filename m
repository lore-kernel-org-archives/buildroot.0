From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 22 Jun 2020 06:35:35 -0500
Subject: [Buildroot] [RFC v9 03/10] cpe-info: only report target pkgs
In-Reply-To: <20200621085651.GB2351@scaer>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200616170341.45098-3-matthew.weber@rockwellcollins.com>
 <20200621085651.GB2351@scaer>
Message-ID: <CANQCQpZ9OqW_abD5ttrH5TNgRZGpb_rqsGKLvhzubaeeWBgJBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Jun 21, 2020 at 3:59 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Matt, All,
>
> On 2020-06-16 12:03 -0500, Matt Weber spake thusly:
> > The reporting of host packages causes some duplication and complicates
> > what is really in the targets configuration. For the purpose of the
> > first version of this patchset, its assumed that host packages aren't
> > relevant for the configuration and we only report the target's
> > contents.
>
> Ah, I see this patch now, which addresses my concerns about hos
> packages in the first patch.
>
> So, I think we should keep the $(1)-cpe-info rule as -is, but filter-out
> host packages as I suggested in the review of the first patch.
>

Sure.

Regards,
Matt
