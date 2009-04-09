From: Cyril HAENEL <chaenel@free.fr>
Date: Thu, 09 Apr 2009 10:07:22 +0200
Subject: [Buildroot] JFFS2 / MTD suggestions
In-Reply-To: <874ox02xqa.fsf@macbook.be.48ers.dk>
References: <20090407083540.15437e75@surf> <49DB861E.8040503@free.fr>
	<874ox02xqa.fsf@macbook.be.48ers.dk>
Message-ID: <49DDACBA.8020708@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Peter Korsgaard a ?crit :
>>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:
>>>>>>             
>
>  Cyril> checking whether we are using the GNU C++ compiler...
>
>  Cyril> 1 hour after it's alway blocked on the last line...
>
>  Cyril> Any idea !?
>
> Not really, but take a look at the configure script around there to
> see what it is doing (add a few echo lines).
>
>   
I need to try to print some echo to find the blocking part in the 
configure script, but I tried to launch the configure script manually 
from the lzo directory with the right option :

./configure --target=arm-linux --host=arm-linux 
--build=i386-pc-linux-gnu --prefix=/usr --exec-prefix=/usr 
--sysconfdir=/etc --without-html-dir --disable-gtk-doc --disable-nls 
--disable-largefile

And it works !! And make compiles lzo successfully.
Really curious, the configure script blocks (with exactly the same 
command line) only when called from high level makefile !?

Cyril

-- 

Cyril Haenel
Registered Linux User #332632
