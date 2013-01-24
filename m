From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Jan 2013 09:26:25 +0100
Subject: [Buildroot] [git commit] polkit: new package
In-Reply-To: <51001FFF.3080400@mind.be> (Arnout Vandecappelle's message of
 "Wed, 23 Jan 2013 18:38:07 +0100")
References: <20130120221146.94C249A440@busybox.osuosl.org>
 <51001FFF.3080400@mind.be>
Message-ID: <87d2wv2dhq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> +config BR2_PACKAGE_POLKIT
 >> +	bool "polkit"
 >> +	depends on BR2_USE_WCHAR # libglib2
 >> +	select BR2_PACKAGE_LIBGLIB2
 >> +	select BR2_PACKAGE_EXPAT
 >> +	help
 >> +	  PolicyKit is a toolkit for defining and handling
 >> +	  authorizations.  It is used for allowing unprivileged
 >> +	  processes to speak to privileged processes.
 >> +
 >> +	  http://www.freedesktop.org/wiki/Software/polkit

 Arnout>  The comment when !BR2_USE_WCHAR is missing, no?

Indeed, will fix - Thanks.

-- 
Bye, Peter Korsgaard
