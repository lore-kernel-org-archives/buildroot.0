From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 11:47:01 +0200
Subject: [Buildroot] [PATCH 1/2] xr819-xradio: new package
In-Reply-To: <20170622101041.3d01e783@windsurf> (Thomas Petazzoni's message of
 "Thu, 22 Jun 2017 10:10:41 +0200")
References: <20170618184200.31167-1-geomatsi@gmail.com>
 <20170618184200.31167-2-geomatsi@gmail.com>
 <20170621224139.720d19cc@windsurf>
 <20170622075519.qp2nbrgekpbhc72i@bars>
 <20170622101041.3d01e783@windsurf>
Message-ID: <87y3skicbu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Yes, it's fine to point to the Armbian github. The only gotcha is how
 > to do this without downloading the entire Github repository. I guess
 > you will have to do something like this:

 > XR819_FIRMWARE_VERSION = 8b4a4ed16f7f9d12e59ff2f9ceba3cc335374dbe
 > XR819_FIRMWARE_SITE =
 > https://github.com/armbian/build/tree/$(XR819_FIRMWARE_VERSION)/bin/firmware-overlay/xr819
 > XR819_FIRMWARE_SOURCE = fw_xr819.bin
 > XR819_FIRMWARE_EXTRA_DOWNLOADS = boot_xr819.bin sdd_xr819.bin

The only problem is that these file names are not versioned, so it is
difficult to ever change them in the future.

But as they are from a vendor dump, that it perhaps not likely to ever
happen.

-- 
Bye, Peter Korsgaard
