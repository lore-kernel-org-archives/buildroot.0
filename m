From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Oct 2015 23:47:08 +0100
Subject: [Buildroot] Buildroot developer meeting report
Message-ID: <5611AC6C.3060007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 As you will have noticed from the mailing list traffic, it's been a very busy
two days at the Buildroot developer meeting in Dublin. You can find the full
report at [1]. Here are the highlights:

- We have decided to proceed with starting a not-for-profit organisation. It
will be based in France. Maxime H. volunteered to get the ball rolling. The plan
is to prepare the statutes in the coming months and sign them at FOSDEM.

- 110 patches were committed, the patchwork queue has been reduced from 331 to
236 patches. We also discussed a few of the difficult patches and series that
are pending, though in fact there are still many more that warrant discussion.

- We decided how to proceed with the runtime testing. Nothing has been committed
yet, the a Jenkins instance is already running at [2].

- When discussing the idea of making .hash files mandatory for all packages, we
discovered that it looks like the tarballs generated automatically by github are
nowadays stable. We'll verify this by adding a couple of hashes for github
packages and check if the autobuilders survive.


 Regards,
 Arnout


[1] http://elinux.org/Buildroot:DeveloperDaysELCE2015#Report
[2] http://jenkins.free-electrons.com/job/buildroot-runtime-tests/
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
