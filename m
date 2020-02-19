From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 22:44:52 +0100
Subject: [Buildroot] [PATCH 2/5] package/libsndfile: annotate
 _IGNORE_CVES for the included security patches
In-Reply-To: <87imk2cl8f.fsf@dell.be.48ers.dk>
References: <20200219160203.874-1-peter@korsgaard.com>
 <20200219160203.874-2-peter@korsgaard.com>
 <20200219200853.58120567@windsurf>
 <87imk2cl8f.fsf@dell.be.48ers.dk>
Message-ID: <20200219224452.1621a259@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Feb 2020 22:37:04 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > What does "disputed" means in this context ?  
> 
> That someone related to the project claims that it isn't a security
> issue or cannot reproduce the issue.
> 
> Specifically for this CVE, see the discussion here:
> 
> https://github.com/erikd/libsndfile/issues/398

That's the kind of thing I assumed, but perhaps we need to add at least
this link next to the IGNORE_CVES line ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
