From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 May 2015 11:26:44 +0200
Subject: [Buildroot] [git commit] CHANGES: Update with recent changes
In-Reply-To: <20150504112015.55294499@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 4 May 2015 11:20:15 +0200")
References: <20150504082612.0FE1C7FA94@busybox.osuosl.org>
 <20150504112015.55294499@free-electrons.com>
Message-ID: <87y4l4r8vf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Peter,
 > On Mon, 4 May 2015 10:25:30 +0200, Peter Korsgaard wrote:

 >> +	Infrastructure: Hashes for a large number of packages have
 >> +	been added. Missing hashes now stop the build unless
 >> +	explicitly disabled.

 > I think another infrastructure change is how make source, make
 > legal-info, make source-check and make external-deps are handled. Most
 > of the changes are purely internal and users don't care, except that
 > the results given by these commands is now correct (i.e includes all
 > packages), while it was not the case in the past. So users should not
 > be surprised to see a different output for 'make legal-info' or 'make
 > external-deps'.

True. I had it on my list, but found it more of an implementation
detail. I'll write up something.

-- 
Venlig hilsen,
Peter Korsgaard 
