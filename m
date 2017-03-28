From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Mar 2017 10:23:15 +0300
Subject: [Buildroot] [PATCH v2] package/synergy: bump to version 1.8.5
In-Reply-To: <1490685439-5913-1-git-send-email-pieterjan.camerlynck@gmail.com>
References: <1490685439-5913-1-git-send-email-pieterjan.camerlynck@gmail.com>
Message-ID: <20170328072315.bcf7ny5wb5vgntuk@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pieterjan Camerlynck,

On Tue, Mar 28, 2017 at 09:17:19AM +0200, Pieterjan Camerlynck wrote:
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> ---
> Changes v1 -> v2
>  - drop gtest dependency
>  - use full path in install

This patch is doing much more than a simple version bump. Please spare a few 
words in the commit log about:

  * The build system change from autotools to cmake

  * The move from sourceforge to github

  * The patches you remove (why?)

  * The patch you add (why?)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
