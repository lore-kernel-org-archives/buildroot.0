From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2015 22:45:05 +0100
Subject: [Buildroot] [PATCH v2] python3: add patch to fix PEP 3147 issue
	with automake built packages
In-Reply-To: <56458B13.2070806@mind.be> (Arnout Vandecappelle's message of
 "Fri, 13 Nov 2015 08:02:43 +0100")
References: <1441023704-27725-1-git-send-email-cvubrugier@fastmail.fm>
 <20151104225541.15eef643@free-electrons.com>
 <20151105000420.5abc2ee1@free-electrons.com>
 <20151112163129.4adc5852@PAL-U515208D001> <56458B13.2070806@mind.be>
Message-ID: <871tbtlgke.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> 2/ Simply do not regenerate "importlib.h" because it is not used.

 >  Most likely, the generated importlib.h doesn't change due to your patch. So the
 > simplest solution is to do a 'touch $(@D)/Python/importlib.h' in a post-patch
 > hook (with a large comment explaining why it is necessary and allowed).

Yes, sounds sensible. Christophe, care to send a patch?

-- 
Bye, Peter Korsgaard
