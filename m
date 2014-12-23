From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 23 Dec 2014 14:35:40 +0000
Subject: [Buildroot] [PATCH] system: run getty on boot console by default
In-Reply-To: <CAGm1_ktzvRWMrZHEVfrQnRdACs-N++Kwx5dq3Xp30YPxN-gQHw@mail.gmail.com>
References: <1419336373-30919-1-git-send-email-abrodkin@synopsys.com>
 <CAGm1_ktp7gkprBXNLTvd3gE7LMv_9cyUXyF3eb3r83OGPie0NQ@mail.gmail.com>
 <1419337919.2781.6.camel@synopsys.com>
 <CAGm1_ktzvRWMrZHEVfrQnRdACs-N++Kwx5dq3Xp30YPxN-gQHw@mail.gmail.com>
Message-ID: <1419345339.2781.9.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Tue, 2014-12-23 at 14:57 +0100, Yegor Yefremov wrote:
> On Tue, Dec 23, 2014 at 1:32 PM, Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
> > Hi Yegor,
> >
> >
> > Did I miss something?
> 
> It could be this issue: http://www.busybox.net/FAQ.html#job_control
> 
> Does it still make problems? When not, then there is no problem.

Even thought I haven't done any extensive testing I don't see any
suspicious behavior.

So I think "console" in BR2_TARGET_GENERIC_GETTY_PORT should be fine.

-Alexey
