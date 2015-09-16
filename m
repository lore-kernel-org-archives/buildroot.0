From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Sep 2015 17:56:55 +0300
Subject: [Buildroot] Question
In-Reply-To: <55F97C1E.1030206@synopsys.com>
References: <55F97C1E.1030206@synopsys.com>
Message-ID: <20150916145655.GM11632@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joao,

On Wed, Sep 16, 2015 at 03:26:38PM +0100, Joao Pinto wrote:
> Could you please tell me if it is possible to have a patch called 
> automatically that changes a certain file in the target root filesystem?

You can use a post build script for that (BR2_ROOTFS_POST_BUILD_SCRIPT). See 
http://nightly.buildroot.org/manual.html#rootfs-custom.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
