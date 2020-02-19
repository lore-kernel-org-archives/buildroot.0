From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 22:37:04 +0100
Subject: [Buildroot] [PATCH 2/5] package/libsndfile: annotate
 _IGNORE_CVES for the included security patches
In-Reply-To: <20200219200853.58120567@windsurf> (Thomas Petazzoni's message of
 "Wed, 19 Feb 2020 20:08:53 +0100")
References: <20200219160203.874-1-peter@korsgaard.com>
 <20200219160203.874-2-peter@korsgaard.com>
 <20200219200853.58120567@windsurf>
Message-ID: <87imk2cl8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 19 Feb 2020 17:01:59 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> Also mark CVE-2018-13419 as disputed.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > What does "disputed" means in this context ?

That someone related to the project claims that it isn't a security
issue or cannot reproduce the issue.

Specifically for this CVE, see the discussion here:

https://github.com/erikd/libsndfile/issues/398

-- 
Bye, Peter Korsgaard
