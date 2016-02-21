From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 22:05:37 +0100
Subject: [Buildroot] [PATCH] package/monit: bump to version 5.16.1
In-Reply-To: <1455025592-25755-1-git-send-email-joerg.krause@embedded.rocks>
References: <1455025592-25755-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160221220537.05f829bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue,  9 Feb 2016 14:46:32 +0100, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/monit/monit.hash | 4 ++--
>  package/monit/monit.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

This doesn't build, as there is no 5.16.1 release upstream:

>>> monit 5.16.1 Downloading
--2016-02-21 21:54:17--  http://mmonit.com/monit/dist/monit-5.16.1.tar.gz
Resolving mmonit.com (mmonit.com)... 62.109.39.247
Connecting to mmonit.com (mmonit.com)|62.109.39.247|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://mmonit.com/monit/dist/monit-5.16.1.tar.gz [following]
--2016-02-21 21:54:17--  https://mmonit.com/monit/dist/monit-5.16.1.tar.gz
Connecting to mmonit.com (mmonit.com)|62.109.39.247|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2016-02-21 21:54:17 ERROR 404: Not Found.

Looking at https://mmonit.com/monit/dist/, the last version is 5.16.

How did you find a 5.16.1 version ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
