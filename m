From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 7 Mar 2017 20:18:17 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-05
In-Reply-To: <20170306210032.GC3976@free.fr>
References: <20170306072844.3738B206EB@mail.free-electrons.com>
 <20170306210032.GC3976@free.fr>
Message-ID: <20170307201817.21c48745@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 6 Mar 2017 22:00:32 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> 
> >          arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/29aa34c4e3b10739a13db6d86b3f0691668480e9
> 
> error: failure memory model cannot be stronger than success memory model
> for '__atomic_compare_exchange'
>   return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 0, __m1, __m2);
> 
> Some atomic issue?
> 

See [1]...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2017-March/186151.html
