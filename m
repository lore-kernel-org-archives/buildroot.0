From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 21:38:21 +0200
Subject: [Buildroot] Build failure with 2017.05.1
In-Reply-To: <20170719210932.59467c37@windsurf> (Thomas Petazzoni's message of
 "Wed, 19 Jul 2017 21:09:32 +0200")
References: <1662234505.617742.1500487581506.JavaMail.zimbra@datacom.ind.br>
 <20170719210932.59467c37@windsurf>
Message-ID: <87eftc5iaa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > We definitely don't want the bump to v3.3.0 in the maintenance branch,
 > unless there are security fixes associated.

 > However, I think we want to do in 2017.02.x and 2017.05.x what we did
 > in master: remove all Github patch downloads, and put the patches in
 > the tree instead. For most of the packages, I believe the commits can
 > be cherry-picked from master. A few packages will need specific
 > adjustments though.

 > Peter, do you agree?

Yes, I'll get to it once I'm done with build testing the current pile of
backports.

-- 
Bye, Peter Korsgaard
