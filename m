From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 23 Oct 2019 18:43:17 +0200
Subject: [Buildroot] [PATCH v3 6/9] package/sysrepo: add package
In-Reply-To: <5e8d93e92af7e12da2c1bdecb3d75f11@walle.cc>
References: <20191011124131.28246-1-heiko.thiery@gmail.com>
 <20191011124131.28246-7-heiko.thiery@gmail.com>
 <5e8d93e92af7e12da2c1bdecb3d75f11@walle.cc>
Message-ID: <CAEyMn7ZaaxWGfZjyJiYvFEfkbL3sXSwW9tzj-ogi+vzMZdVLRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Sysrepo comes with examples ([1]), IMHO it would be useful to have a
> switch in Kconfig to automatically build and install these examples.
>
> -michael
>
> [1]
> https://github.com/sysrepo/sysrepo/blob/906927b4ee2dd0d5bd669d193fc851d14919fbd1/CMakeLists.txt#L267

I already have a sysrepo package version with this option enabled. I
will prepare a new patchset with the other remaining patches/packages
(netopeer2-x).
