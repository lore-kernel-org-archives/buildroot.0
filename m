From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 7 May 2015 06:42:37 +0300
Subject: [Buildroot] Proposal to remove patches from patchwork,
	or find adopters
In-Reply-To: <20150506235353.7740a9d3@free-electrons.com>
References: <20150506235353.7740a9d3@free-electrons.com>
Message-ID: <20150507034237.GQ2183@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, May 06, 2015 at 11:53:53PM +0200, Thomas Petazzoni wrote:
>  * wireshark: remove RPATH tag

I agree with marking this patch as rejected. The RPATH problem needs some kind 
of general solution, though. As the umount "bug" report from some time ago 
indicates, spurious RPATH might cause hard to debug problems.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
