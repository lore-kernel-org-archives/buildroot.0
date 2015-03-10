From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Mar 2015 06:45:29 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: add target to clean targetfs
In-Reply-To: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
Message-ID: <20150310044529.GL2518@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Emeric,

On Mon, Mar 09, 2015 at 08:25:00PM -0400, Emeric Vigier wrote:
> +clean-target:
> +	rm -rf $(TARGET_DIR) $(STAGING_DIR) $(BUILD_DIR)/.root \
> +		$(BUILD_DIR)/*/.stamp_target_installed $(BUILD_DIR)/*/.stamp_staging_installed \
> +		$(BUILD_DIR)/linux-*/.stamp_installed $(BUILD_DIR)/*/.built

.stamp_built ?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
