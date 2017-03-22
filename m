From: =?utf-8?B?RmF0aWggQcWfxLFjxLE=?= <fatih.asici@gmail.com>
Date: Wed, 22 Mar 2017 15:53:17 +0300
Subject: [Buildroot] ninja/python-meson packages
In-Reply-To: <98b7a6164112ee321e9220d5b8c47a33@openmailbox.org>
References: <98b7a6164112ee321e9220d5b8c47a33@openmailbox.org>
Message-ID: <d309c350-d2df-4eb0-8114-bea29d3a05dd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, November 9, 2016 6:26:38 PM +03, C?dric Marie wrote:
> Hi,
>
> Regarding python-meson package that was proposed here:
> http://lists.busybox.net/pipermail/buildroot/2016-June/163437.html
>
>>> However, I could provide a real package infrastructure named 
>>> "meson-package",
>>> but as stated in the discussion about adding support for Cargo (the Rust
>>> package manager), to provide such infrastructure, at least 
>>> one package using
>>> it should also be provided (it is sensible to have a working example of
>>> the infrastructure).
>
>> I would not say one, but at least 4-5 packages, with a pretty good
>> confidence that more packages would be added later on.
>
> Gstreamer has added Meson as an alternative build system (to 
> Autotools) since August 2016:
>
> https://cgit.freedesktop.org/gstreamer/gstreamer/commit/meson.build?id=b2f9808722a0254acba17ef98a612a2792184e12

libepoxy is also another project that uses Meson build system. Since 1.4.0,
the "Building" section in README.md has commands to build with Meson:

  https://github.com/anholt/libepoxy/tree/1.4.1#building

Regards,
Fatih
