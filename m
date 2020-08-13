From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:02:28 +0200
Subject: [Buildroot] [git commit] package/docker-engine: needs some
 kernel options
In-Reply-To: <20200727152220.9307686CA5@busybox.osuosl.org> (Peter Korsgaard's
 message of "Mon, 27 Jul 2020 17:27:09 +0200")
References: <20200727152220.9307686CA5@busybox.osuosl.org>
Message-ID: <87v9hm5sqz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=0390777bfaff6c63acf02160a9b97e2a2066b573
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > according to https://wiki.gentoo.org/wiki/Docker#Kernel /
 > docker-engine/contrib/check-config.sh.

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > [Peter: synchronize with contrib/check-config.sh, only enforce DM options if
 >  device mapper driver is enabled]
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.05.x, thanks (2020.02.x does not have the
LINUX_CONFIG_FIXUPS infrastructure).

-- 
Bye, Peter Korsgaard
