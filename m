From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Nov 2012 10:19:12 +0100
Subject: [Buildroot] [PATCH 1/1] Create a symbolic link to the target
 kernel directory.
In-Reply-To: <75B2C156488F433AB22D082571AE6D4E@JohanW7>
References: <1351729065-31324-1-git-send-email-sagaert.johan@skynet.be>
 <5091CB65.8070409@mind.be>
 <75B2C156488F433AB22D082571AE6D4E@JohanW7>
Message-ID: <20121101101912.310579d7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 1 Nov 2012 02:14:35 +0100, Sagaert Johan wrote:

> I always build modules outside of the buildroot system.
> Is there another (fast ) way ? I don't like to wait 20 seconds for
> buildroot tarring the rootfs. 

I don't see the relation between waiting 20 seconds for Buildroot to
tar the rootfs and the patch you're posting. Care to explain?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
