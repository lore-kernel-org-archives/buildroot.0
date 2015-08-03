From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 3 Aug 2015 18:29:08 +0300
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.1.2
In-Reply-To: <1438606556-22874-1-git-send-email-yba@tkos.co.il>
References: <1438606556-22874-1-git-send-email-yba@tkos.co.il>
Message-ID: <20150803152908.GG3345@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Mon, Aug 03, 2015 at 03:55:56PM +0300, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> In the upstream git://github.com/zeromq/libzmq.git,
> commit 6fdafc458a776e063511bb83dc7791aabea00b05 obviated the need for
> 0001-tests-disable-test_fork-if-fork-is-not-available.patch .
> commit c8ee16940fff19ae3c12b4596c4bd131b2c71996 obviated the need for
> 0004-allow-without-libsodium.patch .

Please update the comment at the ZEROMQ_AUTORECONF assignment as well.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
