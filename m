From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 11:23:29 +0100
Subject: [Buildroot] [PATCH] package/netsurf: use TMP_PREFIX inside the
 build directory
In-Reply-To: <a83d68d6-0482-5df9-a20f-ecf6f31a4ff8@mind.be> (Arnout
 Vandecappelle's message of "Sun, 3 Feb 2019 21:36:51 +0100")
References: <20181217084710.16192-1-thomas.petazzoni@bootlin.com>
 <87ftuv3h31.fsf@dell.be.48ers.dk> <20181218084826.1d669768@windsurf>
 <a83d68d6-0482-5df9-a20f-ecf6f31a4ff8@mind.be>
Message-ID: <87lg2vx36m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>> > -	TMP_PREFIX=$(STAGING_DIR)/usr \
 >>> > +	TMP_PREFIX=$(@D)/tmpusr \  
 >>> 
 >>> Why do we have to set it at all? It looks like it defaults to a
 >>> directory under the build dir as well?
 >> 
 >> Indeed, it does. So it's obviously simpler to drop it. I'll respin the
 >> patch. Thanks!

 >  As

As?

-- 
Bye, Peter Korsgaard
