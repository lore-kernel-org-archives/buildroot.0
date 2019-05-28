From: Jonah Petri <jonah@petri.us>
Date: Tue, 28 May 2019 16:43:34 -0400
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix memory leak in
 systemd-journald
In-Reply-To: <41542c46-571d-aabe-7cc4-3b90015ed24f@mind.be>
References: <1559061746-21387-1-git-send-email-jonah@petri.us>
 <41542c46-571d-aabe-7cc4-3b90015ed24f@mind.be>
Message-ID: <455D57E0-02D2-4C84-8507-E1DAEB6DEBA5@petri.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On 28/05/2019 18:42, Jonah Petri wrote:
>> Systemd-journald would leak memory when recording process info.  Add
>> patch files from upstream systemd.  Note that the patch from 2d5d2e0cc5
>> was taken as well in order to make the needed commit apply cleanly.
>> Bug report: https://github.com/systemd/systemd/issues/11502
>> Accepted patch: https://github.com/systemd/systemd/pull/11527
> 
> Just to be clear (Johan, correct me if I'm wrong), this is for 2019.02 only.
> The patches are already included in v241 on master.
> 

Yes, sorry, I should have been clear on that.  This is for 2019.02 only.  Also, I should have referenced the bugzilla bug:

https://bugs.busybox.net/show_bug.cgi?id=11911 <https://bugs.busybox.net/show_bug.cgi?id=11911>

Best,
Jonah


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190528/1f977289/attachment.html>
