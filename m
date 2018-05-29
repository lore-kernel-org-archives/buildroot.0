From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 May 2018 19:05:21 +0300
Subject: [Buildroot] [PATCH next] usbutils: bump to version 010
In-Reply-To: <87tvqq5ug0.fsf@dell.be.48ers.dk>
References: <72cd45059f9374d5fba3544f26a2f0429f074274.1527597307.git.baruch@tkos.co.il>
 <87tvqq5ug0.fsf@dell.be.48ers.dk>
Message-ID: <20180529160521.zerpdbchdkfnaxrd@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, May 29, 2018 at 05:54:07PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Add GPL-3.0 license for the lsusb.py script.
>  > Update license file location.
> 
>  > The tar archive does not contain the license files from the git tree.
>  > Add a patch adding the license files. This patch is not git formatted
>  > because it only applies to the tar archive.
> 
>  > Upstream fixed tar archive generation for the next release.
> 
>  > Add license files hash.
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Committed to next, thanks.
> 
> Is lsusb.py still only compatible with python 2.x? If not, it would be
> good to also keep it on the target when BR2_PACKAGE_PYTHON3 is enabled.

Good point. Actually lsusb.py has been converted to Python 3 only, just before 
the 010 release. I'll send a fix.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
