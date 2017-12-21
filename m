From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Dec 2017 21:53:16 +0100
Subject: [Buildroot] [PATCH 1/1] gstreamer1: bump packages to 1.12.4
In-Reply-To: <20171221202131.6039-1-Adamduskett@outlook.com> (Adam Duskett's
 message of "Thu, 21 Dec 2017 15:21:31 -0500")
References: <20171221202131.6039-1-Adamduskett@outlook.com>
Message-ID: <87d137zttv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Also remove 0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
 > in gst-plugins-bad as the code has been fixed upstream:
 > see commit id: 536cb125773f36ecc46815e72ffa7ae2bba783d7 for more details

 > Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

Why are you sending this as a single mega patch? Please send per-package
patches like you did for 1.12.3.

-- 
Bye, Peter Korsgaard
