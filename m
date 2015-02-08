From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 8 Feb 2015 19:20:43 +0200
Subject: [Buildroot] [PATCH 1/3] glibc: add version 2.21
In-Reply-To: <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
 <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150208172043.GL16955@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Sun, Feb 08, 2015 at 03:07:05PM +0000, Vicente Olivert Riera wrote:
> - Add version 2.21
> - Add a hash value for it
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

The glibc NEWS for the 2.21 release[1] include this:

* The GNU C Library is now built with -Werror by default.  This can be
  disabled by configuring with --disable-werror.

I think we should add --disable-werror when configuring glibc 2.21.

[1] https://sourceware.org/ml/libc-alpha/2015-02/msg00119.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
