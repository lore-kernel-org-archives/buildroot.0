From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Fri, 12 Jun 2015 09:09:39 +0200
Subject: [Buildroot] [PATCH] directfb: add an option for debugging
	support
In-Reply-To: <557A0A95.7020206@mind.be>
References: <1433882623-15782-1-git-send-email-cedric.marie@openmailbox.org>
 <5578AFEC.4020107@mind.be>
 <339271dfef37197a3b13ecbd8222c28a@openmailbox.org> <5579F071.40802@mind.be>
 <5579FB8D.1020509@openmailbox.org> <557A0A95.7020206@mind.be>
Message-ID: <a1c13d755d737f3080832654d01203e8@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2015-06-12 00:24, Arnout Vandecappelle a ?crit?:
> When disabled, DirectFB does not print any debug information. The 
> drivers will
> be installed to and loaded from /usr/lib/directfb-<version>-pure 
> instead of
> /usr/lib/directfb-<version>.

OK. Sounds better like this :)


>  gfx drivers, input drivers, window systems drivers, ... I think it's 
> drivers
> :-) Only interfaces doesn't fit.

hmmm... I guess you're right :)
Thank you, I will "git format" a nice brand new patch. Coming "soon"...


Regards,

-- 
C?dric
