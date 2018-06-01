From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 1 Jun 2018 07:48:35 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-31
In-Reply-To: <20180601060027.2921620828@mail.bootlin.com>
References: <20180601060027.2921620828@mail.bootlin.com>
Message-ID: <CANQCQpYU-oO=SbYo=eDyunMLTdiYJoCt0JmsOvOZ_uovcwRUwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 1, 2018 at 1:00 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> Build statistics for 2018-05-31
> ===============================

> Results for branch 'next'
> =========================
>

>      sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/5480a6087a5a782505cec88f797116d8679df3ac |
>      sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/982f727495c1d3524685015c34b1cbb1e0bbb4b0 |

Looks like a known issue and has been patched on the master branch. I
left a note on the pull request asking about plans for the 3.5.1.x
release.  https://github.com/google/protobuf/pull/3955

Matt
