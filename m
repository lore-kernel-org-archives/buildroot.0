From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 16:49:34 +0100
Subject: [Buildroot] [PATCH v1 1/3] package/runc: bump to version
 1.0.0-rc93
In-Reply-To: <20210210235203.2819535-1-christian@paral.in> (Christian
 Stewart's message of "Wed, 10 Feb 2021 15:52:01 -0800")
References: <20210210235203.2819535-1-christian@paral.in>
Message-ID: <87y2fuioz5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > https://github.com/opencontainers/runc/releases/tag/v1.0.0-rc93

Is this meant for master or next?

It is in the same series as security bumps, but I see the release notes
talks about a feature-rich release?

It also mentions the following:

For packagers the following changes have been made which will have impact on
your packaging of runc:

    The "selinux" and "apparmor" buildtags have been removed, and now all runc
    builds will have SELinux and AppArmor support enabled. Note that "seccomp"
    is still optional (though we very highly recommend you enable it).

But I see no changes related to this?

-- 
Bye, Peter Korsgaard
