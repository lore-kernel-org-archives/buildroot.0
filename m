From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 6 Feb 2019 08:14:37 -0600
Subject: [Buildroot] [RFC] Getting run-time / defconfig testing maintainers
 feedback of failures
Message-ID: <CANQCQpYBJ05wNamef9ZgdVBruMDUq5pY3x8XixGaww=10ertjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has there been any ideas or proposals so far for giving more
visibility to the CI failures?  I definitely want to contribute if
there is something in progress, otherwise here's a proposal..........

One idea I had been throwing around was since you can personally fork
Buildroot in Gitlab and have your own personal Gitlab-runners doing
the CI builds.  Once the per job trigger series[1] merges, I'd like to
proposed adding a manual section which talks about the following
1) How a user can setup a Buildroot fork on Gitlab
2) Enable it to follow the main Gitlab Buildroot repo
3) Create cron jobs for their test cases
4) Manage notifications to track build failures
5) Notes on Gitlab-runner setup

This doesn't replace the main CI testing and reporting, however it
would put more ownership of defconfigs/run-time test fixing on others.

Thanks!
Matt


[1]  http://patchwork.ozlabs.org/project/buildroot/list/?series=87194&archive=both&state=*
