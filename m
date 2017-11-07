From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Nov 2017 17:27:50 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add myself to packages
In-Reply-To: <20171107145434.0d5c0b6b@windsurf> (Thomas Petazzoni's message of
 "Tue, 7 Nov 2017 14:54:34 +0100")
References: <1510016934-2840-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87a7zyuwhj.fsf@dell.be.48ers.dk> <20171107145434.0d5c0b6b@windsurf>
Message-ID: <8760amuk8p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 07 Nov 2017 13:03:20 +0100, Peter Korsgaard wrote:
 >> >>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:  
 >> 
 >> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>  
 >> 
 >> Committed to next, thanks (it could have gone to master, but to limit
 >> merge conflicts I guess next is better).

 > Merging to next is a bit sad, as it means that none of the autobuilder
 > failures that will occur on those packages will be reported to Matthew,
 > until next is merged back in master. Indeed, I use the "master" branch
 > to decide to whom which autobuilder failure should be sent to.

 > So I would have preferred to see this patch in master. Yes, it will
 > conflict with changes to the DEVELOPERS file merged in next for new
 > package additions, but those conflicts are trivial to resolve.

True - I've cherry picked this on master as well, so we have the best of
both worlds.

-- 
Bye, Peter Korsgaard
