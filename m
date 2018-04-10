From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 10:08:21 +0200
Subject: [Buildroot] [PATCH v4 2/8] gst-plugins-${base, good, bad,
 ugly}: bump to 1.14.0
In-Reply-To: <20180322173220.31791-2-aduskett@gmail.com>
References: <20180322173220.31791-1-aduskett@gmail.com>
 <20180322173220.31791-2-aduskett@gmail.com>
Message-ID: <20180410100821.632c7fd9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Mar 2018 13:32:14 -0400, Adam Duskett wrote:
> These are grouped together because several plugins have been re-arranged and
> there is no way to individually update each plugin package.

The title of this commit should be:

  gst1-plugins-${base, good, bad, ugly}: bump to 1.14.0

i.e notice the gst1- prefix vs. gst-

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
