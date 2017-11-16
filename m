From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Nov 2017 20:07:52 +0200
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: Add myself
In-Reply-To: <87lgj6aylz.fsf@home.blind.guru>
References: <20171116120959.17554-1-mlang@blind.guru>
 <20171116120959.17554-2-mlang@blind.guru>
 <20171116125310.tnklgwkdon7gm3vp@tarshish>
 <87lgj6aylz.fsf@home.blind.guru>
Message-ID: <20171116180752.34gcimkr4zn2nqz7@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mario,

On Thu, Nov 16, 2017 at 07:04:56PM +0100, Mario Lang wrote:
> Baruch Siach <baruch@tkos.co.il> writes:
> 
> > On Thu, Nov 16, 2017 at 01:09:59PM +0100, Mario Lang wrote:
> >> Signed-off-by: Mario Lang <mlang@blind.guru>
> >> ---
> >>  DEVELOPERS | 3 +++
> >>  1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/DEVELOPERS b/DEVELOPERS
> >> index c39348a0b2..190e2b2f60 100644
> >> --- a/DEVELOPERS
> >> +++ b/DEVELOPERS
> >> @@ -1008,6 +1008,9 @@ F:	package/polkit/
> >>  F:	package/sg3_utils/
> >>  F:	package/udisks/
> >>  
> >> +N:	Mario Lang <mlang@blind.guru>
> >> +F:	package/brltty/
> >
> > This should be included in the previous patch.
> 
> I would have done so, but the current documentation suggests otherwise:
> 
> "If you are interested in getting notified of build failures and of
> further changes in the packages you added or modified, please add
> yourself to the DEVELOPERS file. This should be done in a separate
> patch of the series."
> 
> Maybe the documentation needs updating?

The documentation has been updated in commit 8209d72211a (docs: update 
DEVELOPERS modification process).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
