From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 21 Dec 2015 20:44:37 +0200
Subject: [Buildroot] [PATCH 7/8 RFC] packages: use TARGET_PATH
In-Reply-To: <bfe629a2f300528996a23613fb4661b41e972bac.1450712392.git.yann.morin.1998@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
 <bfe629a2f300528996a23613fb4661b41e972bac.1450712392.git.yann.morin.1998@free.fr>
Message-ID: <20151221184436.GB1548@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Dec 21, 2015 at 04:56:58PM +0100, Yann E. MORIN wrote:
> Note that libhid should no longer need that trick, but this woill be
> fixed independently in a follow-up patch.

So can BR_PATH be removed entirely from top Makefile after this patch?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
