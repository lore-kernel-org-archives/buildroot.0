From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 23:06:59 +0100
Subject: [Buildroot] [PATCH 2/5] package/libsndfile: annotate
 _IGNORE_CVES for the included security patches
In-Reply-To: <20200219224452.1621a259@windsurf> (Thomas Petazzoni's message of
 "Wed, 19 Feb 2020 22:44:52 +0100")
References: <20200219160203.874-1-peter@korsgaard.com>
 <20200219160203.874-2-peter@korsgaard.com>
 <20200219200853.58120567@windsurf> <87imk2cl8f.fsf@dell.be.48ers.dk>
 <20200219224452.1621a259@windsurf>
Message-ID: <87eeuqcjuk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 19 Feb 2020 22:37:04 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> > What does "disputed" means in this context ?  
 >> 
 >> That someone related to the project claims that it isn't a security
 >> issue or cannot reproduce the issue.
 >> 
 >> Specifically for this CVE, see the discussion here:
 >> 
 >> https://github.com/erikd/libsndfile/issues/398

 > That's the kind of thing I assumed, but perhaps we need to add at least
 > this link next to the IGNORE_CVES line ?

Do you think so? We don't really do it for the other things, E.G. we
simply claim that a specific patch fixes one or more CVEs, without
necessarily providing a lot of details besides the CVE identifier

From the CVE identifier you can then go and look up a bunch of these
things, E.G. on the Debian securitytracker or on the NVD website.

In a way, this is quite similar to how we claim specific licenses for a
package.

-- 
Bye, Peter Korsgaard
