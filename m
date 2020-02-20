From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2020 08:01:08 +0100
Subject: [Buildroot] [PATCH 2/5] package/libsndfile: annotate
 _IGNORE_CVES for the included security patches
In-Reply-To: <20200219235805.4bd1e291@windsurf> (Thomas Petazzoni's message of
 "Wed, 19 Feb 2020 23:58:05 +0100")
References: <20200219160203.874-1-peter@korsgaard.com>
 <20200219160203.874-2-peter@korsgaard.com>
 <20200219200853.58120567@windsurf> <87imk2cl8f.fsf@dell.be.48ers.dk>
 <20200219224452.1621a259@windsurf> <87eeuqcjuk.fsf@dell.be.48ers.dk>
 <20200219235805.4bd1e291@windsurf>
Message-ID: <87a75dd9or.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> Do you think so? We don't really do it for the other things, E.G. we
 >> simply claim that a specific patch fixes one or more CVEs, without
 >> necessarily providing a lot of details besides the CVE identifier
 >> 
 >> From the CVE identifier you can then go and look up a bunch of these
 >> things, E.G. on the Debian securitytracker or on the NVD website.
 >> 
 >> In a way, this is quite similar to how we claim specific licenses for a
 >> package.

 > Well, it's not a strong opinion, but I believe:

 > # disputed, https://github.com/erikd/libsndfile/issues/398

 > doesn't cost much more than

 > # disputed

 > And it directly tells people reading this .mk file what we mean by
 > "disputed", together with the background information about it.

Fine by me. Do notice that the CVE page directly has this info as well,
so just knowing the CVE identifer will get you to it very fast:

https://nvd.nist.gov/vuln/detail/CVE-2018-13419
https://security-tracker.debian.org/tracker/CVE-2018-13419

-- 
Bye, Peter Korsgaard
