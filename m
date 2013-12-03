From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 11:05:19 +0100
Subject: [Buildroot] [PATCH 1/5] coreutils: belongs to system tools,
	not development
In-Reply-To: <20131203095920.1e46375f@skate> (Thomas Petazzoni's message of
 "Tue, 3 Dec 2013 09:59:20 +0100")
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
 <87zjoipdlk.fsf@dell.be.48ers.dk> <20131203095920.1e46375f@skate>
Message-ID: <8761r6p7vk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Comments, anybody?

 > We've always said that it was important to keep this option so that
 > newcomers don't enable things like coreutils, bash and so on, and use
 > what I'd consider the default "Buildroot experience", i.e Busybox.

True.

 > What made you change your mind about this?

It mainly dates back from when those busybox alternatives didn't get
much testing, so were likely to fail. We default to having busybox
enabled, but I don't think we really need to make it more difficult to
use the alternatives.

E.G. if we support bash/coreutils/.., then we should really support
them.

-- 
Bye, Peter Korsgaard
