From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Fri, 18 Dec 2009 09:08:26 +0100
Subject: [Buildroot] OT: git workflow question
In-Reply-To: <mailman.5919.1260994066.28478.buildroot@busybox.net>
References: <mailman.5919.1260994066.28478.buildroot@busybox.net>
Message-ID: <1531E53627F1F749B4FE809BF2A4EB670155DBC5@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 Dec, 2009 Thomas has written 
>
>> Is this how git is supposed to work?

>No. You should have made your changes in a separate branch instead of a
>master branch. Then, you submit your patches. When they are merged, you
>do "git pull" in your master branch. And then "git branch -d
>yourbranch". If everything has been merged, "git branch -d" will
>succeed, otherwise it will fail (and you can use "git branch -D" to
>remove a branch that hasn't been merged).
>
>This is at least how I'm contributing to Buildroot. Not necessarly the
>cleanest way, I'm no git expert.


Thomas, this is a problem most of the 'NEW' users are facing.

What is the correct way (or supposed correct way) of working with the
buildroot-git, it's quit hard to get the 'picture' of you are not a git
expert.

Is there a known document (or url) that you can recommend, not that we
all need/want te be git experts, but a guide that helps us in getting
some basic git workflow would be nice.


Regards Noel.
