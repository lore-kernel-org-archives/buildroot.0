From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2015 22:48:25 +0100
Subject: [Buildroot] [PATCH 1/2] linux-firmware: menu entries for
	mwifiex blobs
In-Reply-To: <c4a720fa59f51fbfe00ec8c1683e1be09f56b593.1447022391.git.alex.suykov@gmail.com>
 (Alex Suykov's message of "Mon, 9 Nov 2015 00:52:08 +0200")
References: <c4a720fa59f51fbfe00ec8c1683e1be09f56b593.1447022391.git.alex.suykov@gmail.com>
Message-ID: <8737waopna.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Suykov <alex.suykov@gmail.com> writes:

 > Firmware blobs for Marvell WiFi-Ex 8797, 8887, 8897 were already
 > there in linux-firmware tree but relevant options were not in Config.in.

 > Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
 > ---
 > sd8797 is the only one I'm going to use, but since they are all similar
 > I added the rest as well.

Committed both to next, thanks.

-- 
Bye, Peter Korsgaard
