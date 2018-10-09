From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 09 Oct 2018 09:13:00 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-10-08
In-Reply-To: <20181009060047.754D6207C3@mail.bootlin.com>
References: <20181009060047.754D6207C3@mail.bootlin.com>
Message-ID: <875zybmyvn.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thomas Petazzoni writes:
> Results for branch '2018.02.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                 libcurl-7.61.1 | 1 
>
>
> Detail of failures
> ------------------
>
>          arm |                 libcurl-7.61.1 | NOK | http://autobuild.buildroot.net/results/f98ad90a77295d73c3ef2fc704f5ec187a31832e |     

Commit e7d658e029 (libcurl: add brotli optional dependency) should fix
this build issue in 2018.02.x.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
