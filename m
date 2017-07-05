From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed,  5 Jul 2017 16:06:32 +0300
Subject: [Buildroot] [PATCH 0/1] Correctly detect GCC version when GCC 7 is
	available in the host
Message-ID: <20170705130633.12365-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

Arch Linux has had GCC 7.x packages for a while, and when using it the
BR2_HOST_GCC_AT_LEAST_<num> configuration variables are not populated.

The following patch fixes the issue. I have just finished successfully a
complete build for the Raspberry Pi 3 including some packages which depend
on BR2_HOST_GCC_AT_LEAST_<num> config variables.

Cheers,


Adrian Perez de Castro (1):
  Config.in: add BR2_HOST_GCC_AT_LEAST_7

 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.13.2
