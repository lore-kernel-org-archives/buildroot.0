From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 23:21:14 +0100
Subject: [Buildroot] [PATCH] busybox: adjust nommu swaponoff handling
	for busybox 1.26.0+
In-Reply-To: <8bd87291-94ba-a085-c463-efac2a3fe1c3@mind.be> (Arnout
 Vandecappelle's message of "Tue, 20 Dec 2016 23:11:27 +0100")
References: <20161220215347.10629-1-peter@korsgaard.com>
 <8bd87291-94ba-a085-c463-efac2a3fe1c3@mind.be>
Message-ID: <87shpi5jj9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> So adjust busybox.config and the logic to disable these applets for nommu
 >> builds for the new names.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 >  However, for the busybox.config part, perhaps it would be better to regenerate
 > it with 'make busybox-update-config'? It currently says that it's for 1.25.1,
 > which looks suspicious :-)

We could. For thix fix I simply wanted to make to make as minimal as
possible change.

Committed, thanks.

-- 
Bye, Peter Korsgaard
