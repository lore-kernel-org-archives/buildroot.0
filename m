From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 14:28:07 +0200
Subject: [Buildroot] [RFC] Unification of package comments on wchar,
 largefile, c++ support, thread, ... support
In-Reply-To: <CAAXf6LWyOHWDxPHkwga4mCy3UaCu93XEvAaXBpRz86wrQyPfnw@mail.gmail.com>
References: <CAAXf6LV7wB6_RsufRWD6s7-viuYheasMHJWqDAGtu6BmPpZBdw@mail.gmail.com>
 <CAAHaz6E16CcRV1gpvFA3KvPfvf78JjqywVJFZxCgs5YOCAeF2g@mail.gmail.com>
 <CAAXf6LWyOHWDxPHkwga4mCy3UaCu93XEvAaXBpRz86wrQyPfnw@mail.gmail.com>
Message-ID: <20130906142807.44427db7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 6 Sep 2013 12:37:05 +0200, Thomas De Schampheleire wrote:

> My question to the community: do we agree on the wording above (foo
> needs a toolchain w/ XXX, YYY)?
> If yes, then I will proceed to making the changes.

Do we really want to use all uppercase, even for things like thread
support?

We have the choice between:

 (1) All lower-case

 comment "directfb needs a toolchain w/ ipv6, rpc, thread, wchar"

 (2) Lower-case, except when it doesn't make sense (acronyms)

 comment "directfb needs a toolchain w/ IPv6, RPC, thread, wchar"

 (3) All upper-case

 comment "directfb needs a toolchain w/ IPv6, RPC, THREAD, WCHAR"

Also, the other question is which features do we mention. IPv6, RPC,
largefile, wchar, C++ and thread have always been there. However, the
need for dynamic library hasn't been always but in the comments, but
you were suggesting to include it. Also, what about MMU dependency ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
