From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:50:21 +0200
Subject: [Buildroot] [PATCH 12/69] file: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-13-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
 <1467498098-23731-13-git-send-email-julien.floret@6wind.com>
Message-ID: <20160703085021.4ece2fc3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 00:20:41 +0200, Julien Floret wrote:

> +HOST_FILE_DEPENDENCIES = host-file host-zlib

With this, host-file would depend on host-file: circular dependency. So
I've dropped host-file here, and applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
