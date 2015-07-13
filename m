From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 14:39:21 +0300
Subject: [Buildroot] [PATCH] CHANGES: add release note for the
	permissions
In-Reply-To: <1436787388-24414-1-git-send-email-arnout@mind.be>
References: <1416586748-12936-3-git-send-email-guido@vanguardiasur.com.ar>
 <1436787388-24414-1-git-send-email-arnout@mind.be>
Message-ID: <20150713113921.GS2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Jul 13, 2015 at 01:36:28PM +0200, Arnout Vandecappelle (Essensium/Mind) wrote:
> Since the rsync of skeleton or rootfs now changes the permissions of
> the copied files and directories, this may break existing setups that
> rely on these permissions being kept. So add a release not explaining

note

> how it should be done.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
