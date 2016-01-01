From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jan 2016 19:48:37 +0100
Subject: [Buildroot] [PATCH] package/dillo: enable jpeg support only
	with libjpeg provider
In-Reply-To: <5686C2AA.90806@gmail.com> (Romain Naour's message of "Fri, 1 Jan
 2016 19:17:14 +0100")
References: <1451671683-10101-1-git-send-email-romain.naour@gmail.com>
 <20160101181326.GA2182@free.fr> <5686C2AA.90806@gmail.com>
Message-ID: <87ziwprv96.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 >> Can dillo be build with jpeg-turbo? If so, it would better to do:

 > Yes indeed but I don't know much dillo, I'm not sure it can be build or used
 > with jpeg-turbo. I added a dependency on the jpeg provider because it how it
 > work right now.

jpeg-turbo is in general compatible with libjpeg (E.G. we afaik don't
have any other packages that only works with libjpeg). A quick test
build also shows that dillo can be built against jpeg-turbo, so I've
changed it to use 'jpeg' instead - Thanks.

-- 
Bye, Peter Korsgaard
