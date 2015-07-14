From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Jul 2015 18:43:26 +0300
Subject: [Buildroot] [PATCH v4 3/3] toolchain: disable internal for
 blackfin
In-Reply-To: <1436886664-3206-4-git-send-email-guido@vanguardiasur.com.ar>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436886664-3206-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436886664-3206-4-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150714154326.GD2332@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guido,

On Tue, Jul 14, 2015 at 12:11:04PM -0300, Guido Mart?nez wrote:
> The internal toolchain won't work with Cortex-M3, mostly because of the
> fact that some packages (notably: uclibc and glibc) fall back to regular
> ARM instructions in some situations, and Cortex-M3 has no support for
> those kind of instructions.
> 
> So, just disable it for now and rely on the external toolchain.

Subject line does not match the patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
