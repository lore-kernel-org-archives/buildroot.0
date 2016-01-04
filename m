From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2016 00:22:38 +0100
Subject: [Buildroot] [PATCH 1/6] package/mesa3d: reorder select/depends
In-Reply-To: <1451866310-10246-1-git-send-email-romain.naour@gmail.com>
 (Romain Naour's message of "Mon, 4 Jan 2016 01:11:45 +0100")
References: <1451866310-10246-1-git-send-email-romain.naour@gmail.com>
Message-ID: <87egdxhqv5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 >> From [1]:
 > "Even though the ordering has absolutely no consequences in Kconfig, it
 > is not logical (when reading). It is more logical and far easier to
 > understand when depends come first, followed by the selects."

 > Also, the Config.in exemple in the manual suggest to use this coding
 > style [2].

 > [1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
 > [2] http://buildroot.uclibc.org/downloads/manual/manual.html#writing-rules-config-in

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed patch 1-5, thanks. I had already applied a similar patch from
Gustavoz for xapp_xbacklight. That one didn't select libxcb though, but
I guess it doesn't really matter as libX11 pulls it in.

(xcb-util should arguably select libxcb as it is a library instead of
using depends on).

-- 
Bye, Peter Korsgaard
