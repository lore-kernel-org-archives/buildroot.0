From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Sep 2020 19:39:01 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 (Angelo Compagnucci's message of "Thu, 3 Sep 2020 18:44:39 +0200")
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
Message-ID: <87o8mlmoga.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

Hi,

 >> Perhaps for some people the Github pull request workflow makes sense,
 >> but I believe it's important to recognize and realize that there are
 >> also people for which this workflow doesn't make sense.

 > I strongly disagree here.
 > Having to write a patch changelog or download a series through the
 > awful patchwork website doesn't make any sense in 2020 (or using any
 > other commandline tool btw).

Everyone is free to have their opinions, but arguing against command
line tools when Buildroot is exactly built on a bunch of command line
tools (make, shell, git, wget, ..) seems a bit counter productive.


 > But it's not the point here. 419 patches are waiting to be reviewed,
 > action must be taken.

Agreed, please help review patches.


 > If you move to github/gitlab you can test each one of the patches even
 > before starting a review and mark as change requested without human
 > intervention.

And why wouldn't you be able to do the same with the email based setup
today? With tools like snowpatch (https://github.com/ruscur/snowpatch) or
some basic scripting around the patchwork REST API nicely allows you to
run (command line :P) tools whenever new patches are posted.

The big problem is coming up with good automation and feedback that
helps. check-package, test-pkg and our runtime tests are quite basic,
but already a good start. Please help improving them.


 >> > Buildroot is all about using simple and familiar tools like make and
 >> > Kconfig, and I personally think that this principle should also be applied
 >> > to the contribution process and right now buildroot is one of the last
 >> > active open source projects using the mailing list approach.
 >> 
 >> This is a very biased statement: there are still plenty of open-source
 >> projects that use e-mail based contribution workflow. I don't think we
 >> can call Linux or U-Boot "inactive" projects. Can we? :-)

 > We cannot, but if you look closer, they are ones of the few last
 > projects to be based on ML. Everyone else moved years ago.

Blanket statements like "Everone" aren't very helpful. Furthermore,
projects are not created equal. In the majority of the projects I have
worked on, I had to make U-Boot or Linux kernel modifications and
contributions, but rarely on some random github project.

Anyway, lets keep it constructive here and improve the tooling we have
around the existing workflow rather some wild ideas of changing
everything which is not going to fly.

-- 
Bye, Peter Korsgaard
