From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 26 Feb 2016 14:31:42 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: fix big endian build
In-Reply-To: <1456489054-10492-1-git-send-email-john@keeping.me.uk>
References: <1456489054-10492-1-git-send-email-john@keeping.me.uk>
Message-ID: <20160226123142.GR2225@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John,

On Fri, Feb 26, 2016 at 12:17:34PM +0000, John Keeping wrote:
> From: John Keeping <john@metanate.com>
> 
> This patch has been accepted upstream and requires no changes to apply
> to 5.37.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
> I'm not sure whether an S-o-b should be applied to the patch in this
> commit; the upstream bluez project does not accept patches with an S-o-b
> and the patch included here is the unmodified output of:
> 
>     git format-patch 01d85fdf6a45150e82143803be3373d779d18522

Just add your SoB in the patch then. See 
http://elinux.org/Developer_Certificate_Of_Origin.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
