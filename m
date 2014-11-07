From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 7 Nov 2014 17:41:32 +0100
Subject: [Buildroot] CMake building in a subdirectory
In-Reply-To: <CAHXCMMK9ddV-KdeieCN4AuDVMMx6QHnxoSQLm0qOwPiz_-bpYQ@mail.gmail.com>
References: <CA+TH9VmvRtq9KmXKsxfWDWgUsixg9yL6SMkDEmWNWz18vxuEnw@mail.gmail.com>
 <CAHXCMMK9ddV-KdeieCN4AuDVMMx6QHnxoSQLm0qOwPiz_-bpYQ@mail.gmail.com>
Message-ID: <CA+TH9V=BEeZLo3FHgEPOvEmr7iTcVzw44q8=op5XAS-yA-KJqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

> AFAI remember, only eigen needs this but since it it a header only
> libs, we choose to install stuff manually using the generic-package
> infra.

I think it chould be supported, because it's fairly common pratice
with cmake based sources to build in subdirectory.
It's not meant in any way to be an outside build directory, also even
if can be used that way.

> IIRC, similar propositions were already done.
> Among these, the Thomas P. 's RFC [1] about per-package out-of-tree is
> certainly the most advanced one trying to generalize this feature to
> all infras.
>
> But no work has been merged so far because:
> - we managed to workaround the corner cases (e.g.: eigen);
> - Thomas' RFC raised some questions/concerns [2] whose status are
> unclear (maybe the v3 of the RFC solved them, Thomas?)

Ok, so this package cannot be built with standard buildroot. I really
would like to see an intermediate solution in the meanwhile that RFC
will be upstreamed.

> For the particular package, you could get inspired by the RFC.
>
> Also, maybe it's time to reconsider/revive this RFC?
>
>
> Regards,
>
> [1] http://lists.busybox.net/pipermail/buildroot/2013-May/072611.html
> [2] http://lists.busybox.net/pipermail/buildroot/2013-May/072556.html
>
>
> --
> Samuel



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
