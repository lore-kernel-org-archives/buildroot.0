From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Feb 2016 22:17:18 +0100
Subject: [Buildroot] Report of Buildroot Developer Days FOSDEM 2016
Message-ID: <56BA575E.40007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 Last week Monday and Tuesday we had the Buildroot Developer Days. You can find
a report on the wiki [1].

 The main discussion point at this meeting was the launch of the Buildroot
Foundation, a not-for-profit to support buildroot. Maxime Hadjinlian is handling
the paperwork as we speak. Once the dust settles, you can expect another
announcement about how you can become a member of the Foundation.

 Other important discussion points:

- Participation in GSoC. There is a wiki page [2] to gather the ideas. Deadline
for proposals is February 19.

- On the testing front, no progress has been made except that the continuous
builds of the defconfigs have moved to Travis CI [3].

- We have clarified the license of package patches [4].

There also has been work on improving the relocatable toolchain support (a new
patch series has been posted) and on musl/gettext handling (this has been
merged). But we haven't done as much hacking as usual. Also the list of pending
patches is still over 300.


 Our next events are the Buildroot Summer Camp in Toulouse beginning of July,
and the Buildroot Developer Meeting after ELC-E in Berlin on October 8 and 9.
But before that, don't forget to join the Buildroot Foundation!


 Regards,
 Arnout


[1] http://elinux.org/Buildroot:DeveloperDaysFOSDEM2016
[2] http://elinux.org/Buildroot:GSoC2016Ideas
[3] https://travis-ci.org/buildroot/buildroot-defconfig-testing/builds
[4] http://patchwork.ozlabs.org/patch/576726/
-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
