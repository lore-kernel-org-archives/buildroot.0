From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 09:25:04 +0200
Subject: [Buildroot] [UNSURE]Re:  autoconf caching
In-Reply-To: <CAB0FRst_Vp6Dq43Jeogo820TXOsU7u101CJOOu26G2XEa4k0Pg@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
 <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
 <20140606091548.53f07f90@free-electrons.com>
 <CAE9DZURp2teR8p5WP3OQEZyZ71qD=8U97q03cRd0yHbTsz8FwA@mail.gmail.com>
 <20140607110432.3e52d064@free-electrons.com>
 <CAB0FRst_Vp6Dq43Jeogo820TXOsU7u101CJOOu26G2XEa4k0Pg@mail.gmail.com>
Message-ID: <20140610092504.196e4106@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Sun, 8 Jun 2014 10:19:13 +0200, Fran?ois Perrad wrote:

> The build of perl with qemu takes very very long time.
> The build of perl with perl-cross takes the same time as Linux Kernel
> for example.
> Parallel build with perl-cross seems not supported (this needs a
> confirmation of Alex Suykov, the author of perl-cross).

Would it be possible to investigate how Yocto does the parallel
cross-compilation build of Perl ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
