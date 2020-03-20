From: Gao Xiang <hsiangkao@aol.com>
Date: Fri, 20 Mar 2020 15:05:56 +0800
Subject: [Buildroot] [PATCH v2 1/2] package/erofs-utils: new package
In-Reply-To: <20200319164418.GD10025@scaer>
References: <20200316015838.15183-1-hsiangkao.ref@aol.com>
 <20200316015838.15183-1-hsiangkao@aol.com>
 <20200318223950.GC10025@scaer>
 <20200319132546.GA5552@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200319164418.GD10025@scaer>
Message-ID: <20200320070550.GA1975@hsiangkao-HP-ZHAN-66-Pro-G1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2020 at 05:44:18PM +0100, Yann E. MORIN wrote:
> Gao, All,
> 
> On 2020-03-19 21:25 +0800, Gao Xiang spake thusly:
> > On Wed, Mar 18, 2020 at 11:39:50PM +0100, Yann E. MORIN wrote:
> > > Gao, All,
> > > 
> > > On 2020-03-16 09:58 +0800, Gao Xiang spake thusly:
> > > > This patch adds EROFS userspace tool erofs-utils to buildroot,
> > > > which can be used to generate EROFS images.
> > > > 
> > > > Signed-off-by: Gao Xiang <hsiangkao@aol.com>
> > > 
> > > Applied to master, with the following fixes:
> > > 
> > >   - add explicit --enable-lz4
> > >   - explain why autoreconf
> > >   - add DEVELOPPER entry
> > > 
> > > Thanks!
> > 
> > Thanks for taking time & your help on this patch, it looks good
> > to me. :)
> 
> No problem, thanks for the patch.
> 
> > And if possible, could you also kindly consider [PATCH v2 2/2]?
> 
> I just ran out of time yesterday to look at it. I'ts still on my tablets
> to handle it.

That's fine :)

> 
> One thing that would be nice, is to have a runtime test for it, like we
> have for the other filesystems:
>     support/testing/tests/fs/

Okay, I will try to write some script later in my free time.

Thanks,
Gao Xiang

> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
