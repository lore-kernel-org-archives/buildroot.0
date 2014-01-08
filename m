From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jan 2014 23:51:32 +0800
Subject: [Buildroot] [PATCH 2/5] toolchain/external: fix wrapper by not
 passing conflicting flags
In-Reply-To: <CAGduivx327zJ_Vy=NDzE9pQKBEkd+OPWHLw2SOYaHACMtvX07Q@mail.gmail.com>
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <5d0fbb9b1f4439750dde9bb7788b273ec94a3bd5.1389134731.git.yann.morin.1998@free.fr>
 <CAGduivx327zJ_Vy=NDzE9pQKBEkd+OPWHLw2SOYaHACMtvX07Q@mail.gmail.com>
Message-ID: <20140108235132.2e741f4a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Wed, 8 Jan 2014 13:45:59 +0100, Maxime Hadjinlian wrote:

> Shouldn't we change the different defconfig that exists ? At least the
> RaspberryPi so it would sets an example (and maybe add something about
> this in the manual ?)

Why would the defconfig need some changes following this patch?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
