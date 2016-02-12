From: James Knight <james.knight@rockwellcollins.com>
Date: Fri, 12 Feb 2016 10:56:59 -0500
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: remove findfs option
In-Reply-To: <20160212144538.600d12a9@free-electrons.com>
References: <1455223174-5204-1-git-send-email-james.knight@rockwellcollins.com>
 <20160212144538.600d12a9@free-electrons.com>
Message-ID: <CALe+oY93=VcH5M5iL_HDPGCXa9U-q3SEyp_dmCuMnc5j8xUfLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Feb 12, 2016 at 8:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> I see only one thing missing from this commit: Config.in.legacy
> handling.

Oops! I'll re-submit with "BR2_PACKAGE_E2FSPROGS_FINDFS" in
Config.in.legacy file.
