From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 15:59:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: check for selinux
In-Reply-To: <20190319153149.84900-1-aduskett@gmail.com> (aduskett@gmail.com's
 message of "Tue, 19 Mar 2019 11:31:49 -0400")
References: <20190319153149.84900-1-aduskett@gmail.com>
Message-ID: <87wokkqs6l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > If libselinux is selected, explicitly set --enable-selinux in the configure
 > options and build the library first.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
