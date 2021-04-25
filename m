From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Apr 2021 09:44:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/genext2fs: bump to version 1.5.0
In-Reply-To: <87wnsyxen2.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 19 Apr 2021 21:23:13 +0200")
References: <20210414214439.1381969-1-fontaine.fabrice@gmail.com>
 <016dd397-3ae8-d6af-c3f8-8a88d72bedb0@mind.be>
 <b37de2fb-72ef-f5c0-b714-8fae2b4956e0@yandex.ru>
 <70d40419-5b26-453a-e806-ab47d9f22e1b@mind.be>
 <87wnsyxen2.fsf@dell.be.48ers.dk>
Message-ID: <87im4areoq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> Because on the target, you can generally simply do an mkfs directly of the
 >> partition, then mount it, then set permissions and/or populate it as needed.
 >> Even the mkfs from busybox is usually sufficient on target.

 >> Of course, Buildroot lives for borderline cases :-). But specifically for the
 >> stable branches, I don't think it's very cost-effective to spend time on making
 >> them work, unless there's a user who does the effort (because they actually need
 >> it).

 > So in case the above is unclear, could you please do a backport of the
 > patch (and verify that it works) and send a patch for the LTS branch
 > (2021.02.x)?

I ended up doing it myself:

https://git.buildroot.net/buildroot/commit/?h=2021.02.x&id=a4822f31ca985192595cf04246e4d6c1f88f168f

Please verify that it works for you, thanks.

-- 
Bye, Peter Korsgaard
