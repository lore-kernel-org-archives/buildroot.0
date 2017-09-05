From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 5 Sep 2017 15:36:34 +0300
Subject: [Buildroot] [PATCH 1/1] libxml2: bump to version 2.9.5
In-Reply-To: <20170905122010.19409-4-aduskett@gmail.com>
References: <20170905122010.19409-1-aduskett@gmail.com>
 <20170905122010.19409-4-aduskett@gmail.com>
Message-ID: <20170905123634.6c72kavt3hfv3wne@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Tue, Sep 05, 2017 at 08:20:08AM -0400, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...ix-XPointer-paths-beginning-with-range-to.patch | 178 ---------------
>  ...sallow-namespace-nodes-in-XPointer-ranges.patch | 253 ---------------------
>  package/libxml2/libxml2.hash                       |   2 +-
>  package/libxml2/libxml2.mk                         |   2 +-
>  4 files changed, 2 insertions(+), 433 deletions(-)
>  delete mode 100644 package/libxml2/0001-Fix-XPointer-paths-beginning-with-range-to.patch
>  delete mode 100644 package/libxml2/0002-Disallow-namespace-nodes-in-XPointer-ranges.patch

This release also fixes a number of security issues. From the git log: 
CVE-2017-9049, CVE-2017-9050, CVE-2017-9047, CVE-2017-9048, CVE-2017-5969.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
