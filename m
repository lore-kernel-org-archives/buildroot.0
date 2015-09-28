From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Sep 2015 20:27:49 +0300
Subject: [Buildroot] [PATCH v3 2/4] pkg-generic: prevent _SITE URLs with
 a trailing slash
In-Reply-To: <1443456634-21484-3-git-send-email-luca@lucaceresoli.net>
References: <1443456634-21484-1-git-send-email-luca@lucaceresoli.net>
 <1443456634-21484-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150928172749.GA2309@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

On Mon, Sep 28, 2015 at 06:10:32PM +0200, Luca Ceresoli wrote:
> A trailing slash in FOO_SITE is useless, since Buildroot automatically adds
> a slash between FOO_SITE and the filename as appropriate.
> 
> Moreover they are potentially armful, which led to introducing a workaround

harmful?

> to strip them:

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
