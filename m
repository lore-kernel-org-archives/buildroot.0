From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 15:48:18 +0200
Subject: [Buildroot] additional autobuilder
In-Reply-To: <CANQCQpa55xCW4icNF5oHJgr6TE269v0LFAr=L5ABdg8qtymFJQ@mail.gmail.com>
References: <CANQCQpa55xCW4icNF5oHJgr6TE269v0LFAr=L5ABdg8qtymFJQ@mail.gmail.com>
Message-ID: <20140923154818.2cd7d35c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Tue, 23 Sep 2014 08:25:27 -0500, Matthew Weber wrote:

> I've got some spare resources on a build machine and would like to run
> an autobuilder instance.

Great!

>  Would you be willing to help me get setup
> with the authentication and test a failure submission (I believe I
> have my firewall rules in order to make this work)?

Sure. I'll send you a private e-mail with some credentials.

However, why are you talking about "failure submission" ? We are
interested in the report of all build results, both success and
failures.

Also, please run the autobuild-run script for a while without
submitting the build results to autobuild.buildroot.org (this is done
by not passing any login/password to the script), and then analyze the
build results, and make sure you don't have too much bogus build
failures caused by setup issues on your side (like missing download
utilities like git, bzr, cvs, svn and so on).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
