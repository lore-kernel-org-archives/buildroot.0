From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 7 Nov 2012 23:59:38 +0100
Subject: [Buildroot] [PATCH 1/1] qextserialport : fix download and bump
	version
In-Reply-To: <874nl1avsi.fsf@dell.be.48ers.dk>
References: <1352317186-2905-1-git-send-email-sagaert.johan@skynet.be>
 <874nl1avsi.fsf@dell.be.48ers.dk>
Message-ID: <F77F3F584BF440F5913944B543E01DC3@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

I enabled it because my customer will write his GUI software in QT, so I decided I would include it in the build.
I have no clue how to use it, but I think it encapsulates serial comm. The QT way with cross platform qt api's.

I did not try to build that package for my linux host.

Regards Johan

-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: woensdag 7 november 2012 23:33
Aan: Sagaert Johan; thomas.petazzoni at free-electrons.com
CC: buildroot at busybox.net
Onderwerp: Re: [PATCH 1/1] qextserialport : fix download and bump version

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

Thanks, but it still doesn't build with a base Qt config here as it tries to link with QtGui / QtNetwork, which imho doesn't make
much sense for a serial lib.

Now, I know next to nothing about qmake, but it is probably related to the windows version using QtGui.

Thomas, can you take a look at it?

--
Bye, Peter Korsgaard
