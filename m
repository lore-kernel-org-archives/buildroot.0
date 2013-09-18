From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 06:18:38 +0200
Subject: [Buildroot] [PATCH] qt: install translations
In-Reply-To: <1379013156-9918-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1379013156-9918-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20130918061838.6d5424cd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vivien Didelot,

On Thu, 12 Sep 2013 15:12:36 -0400, Vivien Didelot wrote:
> The Qt translation files are currently created and moved under
> $(STAGING_DIR)/usr/translations but not installed on the target.
> 
> This patch defines the translations directory to
> /usr/share/qt/translations and defines a QT_INSTALL_TARGET_TRANSLATIONS
> macro to deploy them from the staging directory to the target directory.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
