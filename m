From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 21 Mar 2017 19:22:43 +0200
Subject: [Buildroot] [PATCH] poppler: bump version to 0.53.0
In-Reply-To: <87h92mlh8f.fsf@dell.be.48ers.dk>
References: <20170321154109.1311-1-Vincent.Riera@imgtec.com>
 <87h92mlh8f.fsf@dell.be.48ers.dk>
Message-ID: <20170321172243.asedlzsa4ypg3ix3@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Mar 21, 2017 at 05:36:16PM +0100, Peter Korsgaard wrote:
> >>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Committed, thanks.
> 
> I see from the release notes that it now uses C++11 mode, so we might
> need to add a dependency on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7, but lets see
> what the autobuilders say.

This is not in master as of 1106771a414ede1.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
