From: Theo Debrouwere <theo.debrouwere@skynet.be>
Date: Sun, 11 Sep 2016 23:56:27 +0200
Subject: [Buildroot] [PATCH] pugixml: new package
In-Reply-To: <20160911230830.0bc783a5@free-electrons.com>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
 <1473262627-14429-1-git-send-email-theo.debrouwere@skynet.be>
 <1473262627-14429-2-git-send-email-theo.debrouwere@skynet.be>
 <20160911230830.0bc783a5@free-electrons.com>
Message-ID: <20160911215627.fuqvlcqo4rh67uc3@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> This new package is causing a number of build failures. See:
>
>   http://autobuild.buildroot.net/?reason=pugixml-1.7
>
> Could you have a look?


The bfin issues seems to be caused by a fault in the CMakelist.txt file.
Which seems to have been solved in the upstream git repo.
I will test the fix & verify that it solves the issue.

If it does, I'll provide the fix as a patch on 1.7, unless you/someone
else prefers bumping to an unreleased git commit.


The arc issue: the compiler complains about an internal error.
I'm not sure if this is a pugimxl issue, but I'll reproduce it
tomorrow. (currently building bfin)



Theo
