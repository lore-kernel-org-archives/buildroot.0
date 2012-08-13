From: Jan Pohanka <xhpohanka@gmail.com>
Date: Mon, 13 Aug 2012 08:52:27 +0200
Subject: [Buildroot] libev on armv5 - illegal instruction
In-Reply-To: <20120810215623.5d7304a5@skate>
References: <op.wirpbfhyyxxkfz@pohanka-pc> <20120810085836.3c62fe7e@skate>
 <op.witduljwyxxkfz@pohanka-pc> <20120810215623.5d7304a5@skate>
Message-ID: <op.wiyv1poeyxxkfz@pohanka-pc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> The toolchain is not downloaded by Buildroot in your .config. Are you
> sure you have the same toolchain on both build machines?
>

I have checked it again, yes toolchain are the same:
arm-2011.03-41-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 from
Codesourcery

> Also, could you put online:
>
>  - A complete build log on both machines (make clean && make)
>  - The two binaries that are different and causing problems
>

Example and logs can be downloaded from  
http://neuron.feld.cvut.cz/honza/br_test.tar.bz2
Buildroot logs and example source and binaries libev libraries (working  
and not working) are statically linked
with testing application. Compiler is called through BR wrapper (in
BR_PATH/output/host/usr/bin)

best regards
Jan

-- 
Tato zpr?va byla vytvo?ena p?evratn?m po?tovn?m klientem Opery:
http://www.opera.com/mail/
