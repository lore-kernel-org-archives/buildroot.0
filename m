From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Sep 2020 21:05:42 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <CAOf5uwmN0e4CoO6FyQ8UEGGudy1zSTm_GjRyJhHTCgWqmL5rHw@mail.gmail.com>
 (Michael Nazzareno Trimarchi's message of "Fri, 4 Sep 2020 20:12:49
 +0200")
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
 <CAOf5uwmN0e4CoO6FyQ8UEGGudy1zSTm_GjRyJhHTCgWqmL5rHw@mail.gmail.com>
Message-ID: <87ft7xmkft.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Nazzareno Trimarchi <michael@amarulasolutions.com> writes:

Hi,

 >> And why wouldn't you be able to do the same with the email based setup
 >> today? With tools like snowpatch (https://github.com/ruscur/snowpatch) or
 >> some basic scripting around the patchwork REST API nicely allows you to
 >> run (command line :P) tools whenever new patches are posted.
 >> 

 >  I think that we should explore using snowpatch. Problem is to have a setup
 > and some machines that can run the CI. Is there a cost to have this running?

Yes, it would need to run somewhere. Given the machine ressources spent
on the autobuilders and defconfigs/runtime tests already, we can probably
find ressources for that as well. Perhaps osuosl can help?

But before we can do that we would need to figure out exactly what tests
to do and what to report back to the submitter, E.G. running
check-package is trivial, but figuring out what build tests or what
runtime tests to run less so.

-- 
Bye, Peter Korsgaard
