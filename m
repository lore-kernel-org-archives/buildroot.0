From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 16:00:13 +0200
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
In-Reply-To: <20160629155233.510c456e@free-electrons.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <20160629155233.510c456e@free-electrons.com>
Message-ID: <CAHfJR7h01DTkHetP0W196NbmeHCNZZjw6Ju-D9uP3pA6+A1gNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I haven't looked at the series, but did you take into account that just
> grepping for "host-foo" is not sufficient to know if the host-foo
> package is used or not?
>
> Indeed, if a package has:
>
> BAR_DEPENDENCIES = foo
>
> then host-bar automatically has a dependency on host-foo, without
> host-foo being written anywhere.
>
> Can you confirm this is something you have taken into account?

No, I'm afraid I missed this point, sorry...
I checked only for dependencies on host-foo, or BR2_PACKAGE_HOST_FOO presence.

Julien
