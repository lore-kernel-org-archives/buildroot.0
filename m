From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 30 Mar 2018 10:59:51 +0300
Subject: [Buildroot] [PATCH] busybox: bump version to 1.28.2
In-Reply-To: <871sg284dc.fsf@dell.be.48ers.dk>
References: <20180329162251.30655-1-peter@korsgaard.com>
 <871sg284dc.fsf@dell.be.48ers.dk>
Message-ID: <20180330075951.m56kpqepvkkp5nij@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Mar 30, 2018 at 08:27:43AM +0200, Peter Korsgaard wrote:
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
>  > Drop 0003-tar-unzip-postpone-creation-of-symlinks-with-suspici.patch now upstream.
>  > From the release notes:
> 
>  > Bug fix release.  1.28.2 has fixes for tcpsvd (fixed fallout from
>  > opt_complementary removal), udhcpd (do not ignore SIGTERM), tar and unzip
>  > (reverted to previous, more permissive symlink handling), ssl_client (fixed
>  > option parsing).
> 
>  > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> Committed, thanks.

Not in master as of be824409c4.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
