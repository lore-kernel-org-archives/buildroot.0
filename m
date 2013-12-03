From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 11:34:31 +0100
Subject: [Buildroot] [PATCH 1/5] coreutils: belongs to system tools,
	not development
In-Reply-To: <20131203111216.5452f30d@skate> (Thomas Petazzoni's message of
 "Tue, 3 Dec 2013 11:12:16 +0100")
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
 <87zjoipdlk.fsf@dell.be.48ers.dk> <20131203095920.1e46375f@skate>
 <8761r6p7vk.fsf@dell.be.48ers.dk> <20131203111216.5452f30d@skate>
Message-ID: <87li02nryg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> E.G. if we support bash/coreutils/.., then we should really support
 >> them.

 > I definitely agree with this last part, but I don't see how "really
 > supporting them" conflicts with the idea of hiding them by default to
 > avoid having newcomers confused by these.

It's mainly about when the featureset significantly differs between
busybox and the "full" variant. The question if the busybox version is
"good enough" unfortunately is quite system/use case dependent.

-- 
Bye, Peter Korsgaard
