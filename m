From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 17 Dec 2009 22:40:31 +0100
Subject: [Buildroot] OT: git workflow question
In-Reply-To: <20091216203728.1ddc624c@surf>
References: <hgb3a3$88l$1@ger.gmane.org> <20091216203728.1ddc624c@surf>
Message-ID: <4B2AA54F.7060601@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thomas Petazzoni a ?crit :
>
> No. You should have made your changes in a separate branch instead of a
> master branch. Then, you submit your patches. When they are merged, you
> do "git pull" in your master branch. And then "git branch -d
> yourbranch". If everything has been merged, "git branch -d" will
> succeed, otherwise it will fail (and you can use "git branch -D" to
> remove a branch that hasn't been merged).
>
> This is at least how I'm contributing to Buildroot. Not necessarly the
> cleanest way, I'm no git expert.
>   
Could someone update the Buildroot documentation to explain the workflow
for contributing efficiently to the project ?
I'm a newbie with git and it takes me significant time when I want to
share my work with you.
So I'm pretty sure top contributors have tips to not gather and send
patches manually ;-)

Regards,
Julien
