From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 16 Jul 2014 20:33:31 +0200
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <53C6B3F4.6060101@zacarias.com.ar>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
 <53C196B1.6080104@zacarias.com.ar>
 <CAAXf6LXxPunhd=VU2jXqRvE5rFmiApZM1FxaTvLWgHCTqC2e5A@mail.gmail.com>
 <53C6B3F4.6060101@zacarias.com.ar>
Message-ID: <CAAXf6LXBP1rchrLNKdTAERpnRW8Y-mPKj+SCwWpPE3yNLJ7_Wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


On Wed, Jul 16, 2014 at 7:18 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 07/16/2014 02:08 PM, Thomas De Schampheleire wrote:
>
>> Thanks a lot for working on this.
>> If Jeremy or you could respin the main patch, that'd be great. But I
>> assume it can only be applied once all the package fixes are in?
>> Are nano and statserial the only ones needing fixing?
>
> statserial is a generic fix so it was applied yesterday by Thomas P.
> nano depends on the ncursesw config knob - it can be applied but
> technically it's a no-op until ncursesw is in so should be part of the
> series or at least applied immediately after ncursesw.
> allyespackageconfig was my test run and yes, there shouldn't be any
> unpleasant surprises with the patches applied, just maybe a couple of
> sneaked new/bumped packages since my test tree run and now but unlikely
> given that only 2 packages "complained".
> Of course i couldn't finish a similar run on static because that would
> require to fix all static build failures :)
> Regarding the respin we can wait for Jeremy, modify his patch or just do
> an extra patch with the static fix - we still need the nano fix anyway.
> I'd go with the 3rd option since it's pretty straightforward.
> Regards.

I understood from IRC that you will send a patch series including all
necessary changes, thanks!
