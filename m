From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 5 Jan 2018 16:03:03 +0200
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: need NPTL threads
In-Reply-To: <20180105132050.GB22026@airbook.vandijck-laurijssen.be>
References: <20180104113336.6b7ed00a@windsurf.lan>
 <20180104105154.l24rvscxbsliquv3@tarshish>
 <20180104112815.GD18339@airbook.vandijck-laurijssen.be>
 <20180104155213.GC3684@scaer>
 <20180104172352.k6u2i3bkfmovgwgm@tarshish>
 <20180104201958.GB5130@waldemar-brodkorb.de>
 <20180105052334.mc3fabifliw7gzqn@tarshish>
 <20180105101708.GF8058@airbook.vandijck-laurijssen.be>
 <20180105112404.i66kqd6ey6es4don@tarshish>
 <20180105132050.GB22026@airbook.vandijck-laurijssen.be>
Message-ID: <20180105140303.obxm3hqutglt3wun@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kurt,

On Fri, Jan 05, 2018 at 02:20:50PM +0100, Kurt Van Dijck wrote:
> > On Fri, Jan 05, 2018 at 11:17:08AM +0100, Kurt Van Dijck wrote:
> [...] 
> > I agree. There were a few more unrelated comment on this patch. Please fix and 
> > repost.
> 
> Ok, now I got lost.
> I cannot find any comments on this ('[PATCH 1/2] ... NPTL threads') patch other
> than the uclibc remark you had.
> 
> Can you indicate the timestamps of the other comments, so I can re-read them.
> I can't fix anything without those, isn't it?

My comment are archived in the link below:

  http://patchwork.ozlabs.org/patch/855530/

I refer to the part below the 'depends on' that this patch adds.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
