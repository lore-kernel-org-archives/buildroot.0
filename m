From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Nov 2014 16:33:08 +0100
Subject: [Buildroot] [git commit] qt5base: unconditionally install
	Qt5printSupport if widgets are enabled
In-Reply-To: <20141113162635.673fe030@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 13 Nov 2014 16:26:35 +0100")
References: <20141113144933.8E075B4453@busybox.osuosl.org>
 <20141113160320.4391cb1a@free-electrons.com>
 <87vbmji0zv.fsf@dell.be.48ers.dk>
 <20141113162635.673fe030@free-electrons.com>
Message-ID: <87ioiji097.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Thu, 13 Nov 2014 16:17:08 +0100, Peter Korsgaard wrote:

 >> > So why have a Config.in option for this in the first place?
 >> 
 >> Just because I wanted to make as minimal as possible a change now that
 >> we're past -rc1.

 > That makes sense.

Good ;)

 >> I don't follow qt5 development, but presumably this
 >> used to be user settable and could become so again in future qt5
 >> releases.

 > That however seems like a pretty weak argument :-) Do we keep or add
 > options just because they may hypothetically be useful in the future?

I agree it is a bit weak ;) I basically don't really know much about
qt5, so I wanted as minimal as possible a change.

I just noticed that we have the same issue with the network, sql, xml
and test modules, so I will make a similar change for those as well.

I find it quite a pity that qt5base apparently isn't very configurable
after all :/

-- 
Bye, Peter Korsgaard 
