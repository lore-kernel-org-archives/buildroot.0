From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 21 Aug 2019 10:23:52 -0500
Subject: [Buildroot] [PATCH 1/1] package/swconfig: new package
In-Reply-To: <76a4d75c-e0cf-2852-b8af-14fa6b391f45@mind.be>
References: <20190820155119.17636-1-vadim4j@gmail.com>
 <76a4d75c-e0cf-2852-b8af-14fa6b391f45@mind.be>
Message-ID: <CANQCQpaZ3++pZRYOEZoXUU4tbeJ2ZFfF+a=cekw4z-=0SP2_Ow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Aug 20, 2019 at 2:54 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Vadim,
>
> On 20/08/2019 17:51, Vadim Kochan wrote:
> > Add swconfig package which allows to configure switchdev
> > device (Ethernet switch) via netlink interface.

[snip]

> It is considered legacy and new switch drivers should use the DSA (distributed
> switch architecture) kernel framework which makes it possible to use standard
> userspace tools such as ip to configure the switches.
>
>  Also, as far as I understand, it uses a framework that never got upstreamed to
> Linux so you need an openwrt-forked kernel to use it. I think it's worth
> mentioning that in the help text as well.

Just a note, there is also this phytool floating around.  I've got a
similar tool / dummy phy concept in a few products where DSA wasn't
feasible and I needed direct switch access.

https://github.com/wkz/phytool


Matt
