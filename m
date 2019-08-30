From: Mirza Krak <mirza.krak@northern.tech>
Date: Fri, 30 Aug 2019 11:57:07 +0200
Subject: [Buildroot] [PATCH 0/1] board/mender: add a mender board example
 configuration
Message-ID: <CADHdJwBdRuxv+v2oKcGp0Y8efLy7SVOe0KBoe39Qm3amVEkxnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Adam Duskett <Aduskett@gmail.com>
>
> Buildroot currently has all of the needed packages to use Mender as the primary
> update system. However; there isn't any documentation or examples now that
> provide a starting point for users. This lack of documentation makes setting up
> a Mender based update system difficult and time-consuming.

Would be nice to include me on these threads :)

> just FYI, there is a section for Buildroot integrations on Mender hub :)
> Maybe we can also provide this link somewhere ?

The documentation in the package/mender/readme.txt [1] [2] provides a
link to reference board integrations (which are provided in a external
tree).

I also came to the conclusion that there is no "good" mechanism to
share demo/examples and that is why I started on a external tree for
now (the Yocto in me I guess :)), but would love to work with you on
how this can be improved to provide the most value to the community.

One of the things I try to solve in the external tree, to avoid
keeping an extra copy of the original defconfig, instead with script
trying to append the necessary parts for Mender to the "base
defconfig".

[1].https://github.com/buildroot/buildroot/blob/master/package/mender/readme.txt
[2]. https://github.com/mendersoftware/buildroot-mender
[3]. https://github.com/mendersoftware/buildroot-mender/tree/master/buildroot-external-mender/board/freescale/imx8mqevk

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
