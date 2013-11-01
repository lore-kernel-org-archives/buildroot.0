From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 13:15:57 +0100
Subject: [Buildroot] iconv: additional encodings
In-Reply-To: <52734FA0.3060508@gmail.com>
References: <52725222.9050503@gmail.com>
 <CABMiYf_=RK0UJyZLNkW5JU3xSXKMcNxL9-VRxjNpFqtZ3ye50g@mail.gmail.com>
 <0e99777a-09bf-4414-9769-cbfdd10aa040@email.android.com>
 <52734FA0.3060508@gmail.com>
Message-ID: <20131101131557.232faaa6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Pohanka,

On Fri, 01 Nov 2013 07:52:16 +0100, Jan Pohanka wrote:

> I have realized that external toolchain support is a bit patched in the 
> fork that I'm using compared to original one. There is an option to copy 
> files gconv-modules, gconv-modules.cache, CP1250.so, and all other 
> encodings shared libraries to target/usr/lib/gconv directory. I thought 
> that it is a standard directory which the glibc iconv implementation 
> would search shared encodings for. This is not truth because GCONV_PATH 
> has to be set and point there, to make iconv work with all encodings.
> 
> Maybe something similar could be added to standard Buildroot. It took me 
> a day to realize where is the problem.

Do you think you could send a patch to implement this in Buildroot?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
