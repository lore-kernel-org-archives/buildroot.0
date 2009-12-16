From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 16 Dec 2009 20:05:27 +0000 (UTC)
Subject: [Buildroot] OT: git workflow question
References: <hgb3a3$88l$1@ger.gmane.org> <20091216203728.1ddc624c@surf>
Message-ID: <hgbei7$jgr$2@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-12-16, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 16 Dec 2009 16:53:24 +0000 (UTC),
> Grant Edwards <grant.b.edwards@gmail.com> a ??crit :
>
>> Since I had only changed the one file (and those changes had
>> been merged into the master repository) I didn't bother trying
>> to resolve the conflict -- I just blew away my repository and
>> did a 'clone'.
>> 
>> Here's my question: why was there a conflict?
>
> Not sure why, Peter will probably give an explanation.

That question has been answered.

>> Is this how git is supposed to work?
>
> No. You should have made your changes in a separate branch
> instead of a master branch.

Thanks.  That's the clue I was missing.  The tutorials I had
read on git didn't say that -- they showed all work being done
in the master branch.

> Then, you submit your patches. When they are merged, you do
> "git pull" in your master branch. And then "git branch -d
> yourbranch". If everything has been merged, "git branch -d"
> will succeed, otherwise it will fail (and you can use "git
> branch -D" to remove a branch that hasn't been merged).
>
> This is at least how I'm contributing to Buildroot. Not
> necessarly the cleanest way, I'm no git expert.

I certainly sounds like a better approach that what I was doing.

-- 
Grant Edwards                   grante             Yow! !  Now I understand
                                  at               advanced MICROBIOLOGY and
                               visi.com            th' new TAX REFORM laws!!
