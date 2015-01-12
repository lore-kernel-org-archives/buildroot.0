From: Steve Kenton <skenton@ou.edu>
Date: Mon, 12 Jan 2015 12:53:17 -0600
Subject: [Buildroot] [PATCH] dvdauthor : new package
In-Reply-To: <20150112193238.01e9bf95@free-electrons.com>
References: <54B317DE.9090105@ou.edu>	<20150112092800.08ce4350@free-electrons.com>	<54B3E959.2010504@ou.edu>	<20150112163737.6739827b@free-electrons.com>	<54B403C9.8050207@ou.edu>
 <20150112193238.01e9bf95@free-electrons.com>
Message-ID: <54B4181D.5060209@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/12/2015 12:32 PM, Thomas Petazzoni wrote:

> You have to do something like:
> 
> DVDAUTHOR_CONF_ENV = \
> 	ac_cv_prog_FREETYPECONFIG=$(STAGING_DIR)/usr/bin/freetype-config

Ah! The light brightens slightly and the darkness disperses a bit.
I had somehow completely overlooked the *_CONF_ENV

Thanks - Steve
