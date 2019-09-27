From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 26 Sep 2019 23:03:58 -0300
Subject: [Buildroot] Error: could not find a working compiler
In-Reply-To: <b3c196fd-725e-bc4c-1c6e-17c3de2520c9@studenti.polito.it>
References: <b3c196fd-725e-bc4c-1c6e-17c3de2520c9@studenti.polito.it>
Message-ID: <CAJ4jsadoyKThB54wRAF1nODiAsF+6QmWdLxYWLnpTW72o3FHKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 25, 2019 at 5:39 PM Davide Lava <s265361@studenti.polito.it> wrote:
>
> Hi everybody,
>
> I'm trying to install buildroot-2010.08 for the RD129 from elpa.

I suppose you are trying to build an OS for this board:

    http://www.elpa.it/rd129it.html

> When I try to give the command "make" in the terminal it ends up with:
>
> checking compiler /usr/bin/gcc -I/home/davide/RD129/buildroot-2010.08/output/host/include -I/home/davide/RD129/buildroot-2010.08/output/host/usr/include ... no, long long reliability test 1
> configure: error: could not find a working compiler, see config.log for details
> package/gmp/gmp.mk:78: recipe for target '/home/davide/RD129/buildroot-2010.08/output/toolchain/gmp-4.2.4-host/.configured' failed
> make: *** [/home/davide/RD129/buildroot-2010.08/output/toolchain/gmp-4.2.4-host/.configured] Error 1

I suggest you to try Buildroot version 2019.02, at least. You will
unlikely be able to use 2010.08 on any current Linux-based OS. Is
there any particular reason to use a so old version?

-- 
Carlos Santos <unixmania@gmail.com>
