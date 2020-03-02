From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2020 23:00:41 +0100
Subject: [Buildroot] [PATCH] package/lxc: cgroups: initialize cpuset
 properly
In-Reply-To: <20200301210609.930954-1-romain.naour@smile.fr> (Romain Naour's
 message of "Sun, 1 Mar 2020 22:06:09 +0100")
References: <20200301210609.930954-1-romain.naour@smile.fr>
Message-ID: <87tv36e7sm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > The tests.package.test_lxc.TestLxc failure on gitlab
 > is similar to the issue reported by [1] and fixed by [2].

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/454255988

 > [1] https://github.com/NixOS/nixpkgs/issues/75467#issuecomment-569386159
 > [2] https://github.com/lxc/lxc/pull/3109

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: J?r?me Pouiller <jezz@sysmic.org>
 > Cc: Patrick Havelange <patrick.havelange@essensium.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
