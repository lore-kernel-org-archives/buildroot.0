From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Jun 2020 06:31:54 -0500
Subject: [Buildroot] [PATCH 0/3] allow to recompile wireless-regdb
In-Reply-To: <20200612053110.15316-1-dev.kurt@vandijck-laurijssen.be>
References: <20200612053110.15316-1-dev.kurt@vandijck-laurijssen.be>
Message-ID: <CANQCQpZQ5y_vFxqYfa3csEgbP6yrohjY3Oq+aHOnia39ty3WZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kurt,


On Fri, Jun 12, 2020 at 12:47 AM Kurt Van Dijck
<dev.kurt@vandijck-laurijssen.be> wrote:
>
> This series adds an option to recompile wireless-regdb.
> This became necessary in our product for outdoor use.
> In some countries, different regulations apply for indoor
> and outdoor use. The precompiled version of wireless-regdb
> is appropriate for indoor use only.

Thanks for sending this series!

We ran into a similar situation but never tried to upstream an
approach with the wireless-regdb project to have an outdoor profile.
Have you guys looked to see if that would be possible?  With how the
product wireless certs go it could be beneficial to have the outdoor
profile as a standard configuration.

Best Regards,
Matt
