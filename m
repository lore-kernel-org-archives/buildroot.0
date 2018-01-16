From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 09:11:43 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-01-15
In-Reply-To: <20180116070012.904072089C@mail.free-electrons.com> (Thomas
 Petazzoni's message of "Tue, 16 Jan 2018 08:00:12 +0100 (CET)")
References: <20180116070012.904072089C@mail.free-electrons.com>
Message-ID: <87o9luql34.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Build statistics for 2018-01-15
 > ===============================

 >       branch |  OK | NOK | TIM | TOT |
 >       master | 229 |  77 |   2 | 308 |
 >    2017.11.x |  28 |   2 |   0 |  30 |

 > Results for branch 'master'
 > ===========================

 > Classification of failures by reason
 > ------------------------------------

 >               e2fsprogs-1.43.8 | 23
 > linux-firmware-65b1c68c63f9... | 19

The reason why these failed (after seeing a hash mismatch because they
use an older tar version) was a missing / truncated tarball on s.b.o as
it was out of disk space.

I'm in the progress of migrating s.b.o to osuosl.org, so this should be
fixed soon.

-- 
Bye, Peter Korsgaard
