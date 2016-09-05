From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 5 Sep 2016 16:47:09 +0300
Subject: [Buildroot] [PATCH 6/6] e2fsprogs: bump version to 1.43.2
In-Reply-To: <1473082812-690-6-git-send-email-Vincent.Riera@imgtec.com>
References: <1473082812-690-1-git-send-email-Vincent.Riera@imgtec.com>
 <1473082812-690-6-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160905134709.zhnxsqxlloocqvjc@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincente,

On Mon, Sep 05, 2016 at 02:40:12PM +0100, Vicente Olivert Riera wrote:
> Upstream patches removed.

Is autoreconf still needed? It was introduced with cd48a7e572a (e2fsprogs: fix 
build failure with old glibc versions) for the librt patch that this patch 
removes.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
