From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 20 Oct 2015 20:50:51 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-10-19
In-Reply-To: <20151020063015.114A2101605@stock.ovh.net>
References: <20151020063015.114A2101605@stock.ovh.net>
Message-ID: <CAFOYHZC3M5OGnpJHH6kokar7JXYy03yB3XCn2U8voJCx-VP4mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 20, 2015 at 7:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>       xtensa |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/445270aed4c79cde75d54d49d13ffad9d684c61b/
>       x86_64 |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/b8224ea52d962c62ead367343d68bf98a4b9e883/


Both look like the configure step has failed to detect libesmtp.
Despite the fact that there is a dependency and from what I can tell
libesmtp was built first. Trying to reproduce now.
