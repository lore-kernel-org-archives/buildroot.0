From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2015 13:44:37 +0200
Subject: [Buildroot] [PATCH 1/1] Fix umask settings for non-bash shells
	for root user
In-Reply-To: <55E18457.3080302@mind.be> (Arnout Vandecappelle's message of
 "Sat, 29 Aug 2015 12:07:19 +0200")
References: <1434378026-15007-1-git-send-email-vorel@jablocom.com>
 <20150829105707.3d5e0fec@free-electrons.com>
 <20150829092037.GA4857@free.fr> <55E18457.3080302@mind.be>
Message-ID: <87bndquxne.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> My opinion? Here's what I'd do ;-)
 >> 
 >> git rm system/skeleton/root/.bash_*

 >  +1

 >  Even when bash is the default shell, none of these are needed IMHO.

+1 from here as well (for 2015.11).

-- 
Venlig hilsen,
Peter Korsgaard 
