From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jul 2017 09:36:10 +0200
Subject: [Buildroot] [git commit] python-systemd: add new package
In-Reply-To: <20170720211905.D06A28027F@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 20 Jul 2017 23:08:43 +0200")
References: <20170720211905.D06A28027F@busybox.osuosl.org>
Message-ID: <87a83vppud.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e9a6a104bc82fe6425dfcf9344f560904793c8f1
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Add package for official python bindings availibe as a part of systemd
 > project at: https://github.com/systemd/python-systemd

 > Minimal config snippet for utils/test-pkg is as follows (sans
 > backslashes):

 > BR2_INIT_SYSTEMD=y
 > BR2_PACKAGE_PYTHON3=y
 > BR2_PACKAGE_PYTHON_SYSTEMD=y

So the # lines still got dropped :/

-- 
Bye, Peter Korsgaard
