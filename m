From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Mar 2015 17:17:37 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: add target to clean targetfs
In-Reply-To: <54FF062D.8000307@savoirfairelinux.com>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <20150310044529.GL2518@tarshish>
 <54FF062D.8000307@savoirfairelinux.com>
Message-ID: <20150310151737.GA2177@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Emeric,

On Tue, Mar 10, 2015 at 10:56:45AM -0400, Emeric Vigier wrote:
> On 15-03-10 12:45 AM, Baruch Siach wrote:
> >On Mon, Mar 09, 2015 at 08:25:00PM -0400, Emeric Vigier wrote:
> >>+clean-target:
> >>+	rm -rf $(TARGET_DIR) $(STAGING_DIR) $(BUILD_DIR)/.root \
> >>+		$(BUILD_DIR)/*/.stamp_target_installed $(BUILD_DIR)/*/.stamp_staging_installed \
> >>+		$(BUILD_DIR)/linux-*/.stamp_installed $(BUILD_DIR)/*/.built
> >
> >.stamp_built ?
> 
> Yes, you are right.

But why? Isn't .stamp_*_installed removal enough for your needs?

> Also it seems that linux-*/.stamp_installed is deprecated. I only see
> .stamp_target_installed files.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
