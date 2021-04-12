From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 12 Apr 2021 17:52:31 +0300
Subject: [Buildroot] [PATCH] package/bridge-utils: fix missing PATH_MAX
 include
In-Reply-To: <20210412143708.45721-1-matthew.weber@rockwellcollins.com>
References: <20210412143708.45721-1-matthew.weber@rockwellcollins.com>
Message-ID: <87o8ejimhc.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On Mon, Apr 12 2021, Matt Weber wrote:

> Fixes:
> http://autobuild.buildroot.net/results/3ec818e676827c03f08c264c6c7a53b025b7ba1d/
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Fabrice posted a patch for that already. It's committed as
aa75b053baef70c9 ("package/bridge-utils: fix build on musl").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
