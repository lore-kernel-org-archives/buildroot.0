From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:34:50 +0100
Subject: [Buildroot] [PATCH v3 0/4] Allow customization of system
 default PATH
In-Reply-To: <20181220175508.2091-1-mmayer@broadcom.com>
References: <20181220175508.2091-1-mmayer@broadcom.com>
Message-ID: <20181231143450.3c955366@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

On Thu, 20 Dec 2018 09:55:04 -0800, Markus Mayer wrote:

> Markus Mayer (4):
>   system cfg: introduce option BR2_SYSTEM_DEFAULT_PATH
>   skeleton: use BR2_SYSTEM_DEFAULT_PATH as default PATH
>   openssh: use BR2_SYSTEM_DEFAULT_PATH as default PATH
>   dropbear: use BR2_SYSTEM_DEFAULT_PATH as default PATH

Thanks, series applied with minor tweaks to the commit titles, and a
minor tweak to the commit log of PATCH 2/4 related to the double quotes
addition. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
