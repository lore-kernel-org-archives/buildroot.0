From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Mar 2017 08:44:02 +0200
Subject: [Buildroot] [PATCH 4/6] python-mwscrape: use documented license
	abbreviation
In-Reply-To: <20170323100041.45149296@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 23 Mar 2017 10:00:41 +0100")
References: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1490204935-13172-4-git-send-email-rahul.bedarkar@imgtec.com>
 <20170322213900.3ace3cc4@free-electrons.com>
 <20170322223212.GA3591@free.fr>
 <3e6647c5-8b47-d1c1-a0fa-3cbf120759ec@mind.be>
 <20170323100041.45149296@free-electrons.com>
Message-ID: <87fuhx6gul.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 23 Mar 2017 09:25:11 +0100, Arnout Vandecappelle wrote:

 >> >> I think our idea was to keep using GPLv2/LGPLv2.1/GPLv3, but for all
 >> >> other licenses, use the SPDX code as much as possible.
 >> >>
 >> >> Maybe we should bite the bullet, and migrate all packages to use SPDX
 >> >> license codes?  
 >> > 
 >> > That would have my approval, yes.  
 >> 
 >> Indeed, I've been thinking about doing this.

 > OK, so let's just do it :)

Agreed!

 > The only thing that we might consider is the impact of this change for
 > our users. Are people parsing the CSV output, and checking if there is
 > no GPLv3 for example? Such checks would no longer match.

I haven't heard about anybody doing that, but as long as we mention it
in the release notes I don't think it is a big issue.


 > But longer term, I believe we will give our users a much more
 > logical/stable situation if we use SPDX codes everywhere rather than
 > the clunky mix we have today.

Yes, me too!

-- 
Bye, Peter Korsgaard
