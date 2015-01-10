From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 13:16:22 +0100
Subject: [Buildroot] [PATCH v4 0/2]  libsvgtiny: fix source url
In-Reply-To: <1420787643-6167-1-git-send-email-fabio.porcedda@gmail.com>
References: <1420787643-6167-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150110131622.6cdd1a3b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri,  9 Jan 2015 08:14:01 +0100, Fabio Porcedda wrote:

> Fabio Porcedda (2):
>   netsurf-buildsystem: new package
>   libsvgtiny: update source url

Thanks, both applied. For the first patch, I did a minor change: "cp
-r" -> "cp -dpfr", since this is what we use in most Buildroot packages.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
