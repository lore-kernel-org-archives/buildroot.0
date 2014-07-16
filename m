From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 19:50:22 +0200
Subject: [Buildroot] [PATCH v2] qt5: Add an option to select default
 platform
In-Reply-To: <1405526331-31440-1-git-send-email-jezz@sysmic.org>
References: <1405526331-31440-1-git-send-email-jezz@sysmic.org>
Message-ID: <20140716195022.3c5094a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Wed, 16 Jul 2014 17:58:51 +0200, J?r?me Pouiller wrote:
> Whithout this path, default platform is automaticaly set (generally
> set to "eglfs" as defined in
> qt5base/mkspecs/devices/common/linux_device_pre.conf:1). This choice
> is not always what the user would like. Thus, user have to manually
> appends "-platform <BACKEND>" to command line when running any qt5
> application.
> 
> This patch allows user to choose default platform explicitly.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Thanks, applied with the minor fixes suggested by Yann E. Morin.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
