From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:27:33 +0200
Subject: [Buildroot] [PATCH 2/2] package/mender: install additional
 inventory scripts
In-Reply-To: <20190514090450.20142-3-mirza.krak@northern.tech> (Mirza Krak's
 message of "Tue, 14 May 2019 11:04:50 +0200")
References: <20190514090450.20142-1-mirza.krak@northern.tech>
 <20190514090450.20142-3-mirza.krak@northern.tech>
Message-ID: <87lfyehgyi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mirza" == Mirza Krak <mirza.krak@northern.tech> writes:

 > There are two additional inventory scripts provided in
 > the Mender client repository, lets install them.

 > - mender-inventory-os
 >     - will push content of /etc/os-release
 > - mender-inventory-rootfs-type
 >     - will push filesystem type of rootfs

 > Signed-off-by: Mirza Krak <mirza.krak@northern.tech>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
