From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Nov 2012 00:02:09 +0100
Subject: [Buildroot] [PATCH 1/1] qextserialport : fix download and bump
	version
In-Reply-To: <874nl1avsi.fsf@dell.be.48ers.dk>
References: <1352317186-2905-1-git-send-email-sagaert.johan@skynet.be>
 <874nl1avsi.fsf@dell.be.48ers.dk>
Message-ID: <20121108000209.223413fe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 07 Nov 2012 23:32:45 +0100, Peter Korsgaard wrote:
> >>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:
> 
>  Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> 
> Thanks, but it still doesn't build with a base Qt config here as it
> tries to link with QtGui / QtNetwork, which imho doesn't make much sense
> for a serial lib.
> 
> Now, I know next to nothing about qmake, but it is probably related to
> the windows version using QtGui.
> 
> Thomas, can you take a look at it?

I'll have a look, but I can't say when. I'll most likely be very busy
over the next 3 weeks or so.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
