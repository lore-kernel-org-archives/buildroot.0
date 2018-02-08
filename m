From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 8 Feb 2018 13:45:31 +0200
Subject: [Buildroot] [PATCH 2/3] package/libgpiod: Bump to stable 1.0
In-Reply-To: <e5dd92052698b756ed2e956aa246ea22276c97b5.1518089469.git.jan.kundrat@cesnet.cz>
References: <45c17d05433e7bb40ff6e2b30c5cb41fed04ec76.1518089469.git.jan.kundrat@cesnet.cz>
 <e5dd92052698b756ed2e956aa246ea22276c97b5.1518089469.git.jan.kundrat@cesnet.cz>
Message-ID: <20180208114531.a2buxydflbqk74fi@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

On Thu, Feb 08, 2018 at 10:27:36AM +0100, Jan Kundr?t wrote:
> According to upstream, this one has non-backward-compatible API changes,
> so porting of end users' code will be required. On the other hand, the
> library also got a stable API now.
> 
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

The libgpiod maintainer has posted a bump patch yesterday.

  http://patchwork.ozlabs.org/patch/870463/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
