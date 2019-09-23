From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 14:08:47 +0200
Subject: [Buildroot] [PATCH] toolchain: generate check-headers program
 under $(BUILD_DIR)
In-Reply-To: <18546_1569240317_5D88B4FD_18546_367_2_20190923120448.GC3174@r-lnx-nyma7486-2>
References: <20190923010514.16269-1-unixmania@gmail.com>
 <6515_1569227955_5D8884B3_6515_6_12_20190923083847.GB3174@r-lnx-nyma7486-2>
 <CAJ4jsadbeyaFRcSYUWsBvTqAOCHQEhipQ8R4V31Hp8F29QdFVQ@mail.gmail.com>
 <18546_1569240317_5D88B4FD_18546_367_2_20190923120448.GC3174@r-lnx-nyma7486-2>
Message-ID: <20190923140847.4542d685@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 14:04:48 +0200
<yann.morin@orange.com> wrote:

> I don't know what distro mounts /tmp as a tmpfs by default. It is
> certainly not the case on my Ubuntu, or on Debian when I last installed
> one...

$ mount | grep "/tmp"
tmpfs on /tmp type tmpfs (rw,nosuid,nodev)

Regular Fedora 30 installation.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
