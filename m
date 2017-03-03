From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Mar 2017 20:32:27 +0100
Subject: [Buildroot] [PATCH 1/1]
	package/x11r7/xdriver_xf86-video-vmware: fix compilation
	without udev
In-Reply-To: <20170302113244.kjszgkgdmcn3xtmu@tarshish> (Baruch Siach's
 message of "Thu, 2 Mar 2017 13:32:44 +0200")
References: <20161218143246.30156-1-bernd.kuhls@t-online.de>
 <20170301234014.319ba007@free-electrons.com>
 <87shmwgnil.fsf@dell.be.48ers.dk>
 <20170302113244.kjszgkgdmcn3xtmu@tarshish>
Message-ID: <87tw7af96c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Thu, Mar 02, 2017 at 08:12:50AM +0100, Peter Korsgaard wrote:
 >> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
 >> > Applied to master, thanks. Peter, this one could go to the LTS branch.
 >> 
 >> Thanks, applied to 2017.02.x.

 > Is there a reason why 2017.02.x branch commits are not posted to the list? 
 > Commits to the 2016.11.x branch used to appear on the list.

They are (I see them at least). I think the issue is just that the
send-mail script has a minor bug when a new branch is pushed. In that
case it sends a small mail saying 'new branch created', and forgets to
send a notification mail for the individual commits added in that push.

I did my initial push with 3 commits, that is why no notification is
sent for those 3 commits.

-- 
Bye, Peter Korsgaard
