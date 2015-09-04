From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 4 Sep 2015 15:16:50 +0300
Subject: [Buildroot] [PATCH v3 3/5] dos2unix: remove WCHAR dependency
In-Reply-To: <55E977E9.3040404@imgtec.com>
References: <35a5aad580e5c2cae7eb79522f11a1aded941caf.1441253454.git.baruch@tkos.co.il>
 <934c9f1ca101afba70b5fe1efeaea01767ec95fd.1441253454.git.baruch@tkos.co.il>
 <55E977E9.3040404@imgtec.com>
Message-ID: <20150904121650.GO18583@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Fri, Sep 04, 2015 at 11:52:25AM +0100, Vicente Olivert Riera wrote:
> On 09/03/2015 05:10 AM, Baruch Siach wrote:
> > Add a patch fixing wchar build failure.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

[...]

> Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Any instructions on how to reproduce the build failure so I can test it?
> Also, does that patch fixes an autobuild failure? If so, please add the
> "Fixes" line and the URL.

This patch doesn't fix any build failure because current Buildroot master 
doesn't support target dos2unix. Event with the previous patches applied, the 
WCHAR dependency would prevent the build failure that the patch describes.

Thanks for reviewing,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
