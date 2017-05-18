From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 18 May 2017 07:37:54 -0500
Subject: [Buildroot] [PATCH 1/1] package/avrdude: fix gpio definition,
	add kconfig option
In-Reply-To: <1495061934-57465-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1495061934-57465-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpbh3RSGKfkEiO=appPaJ67rOOqq7W5AxJm9yPAzBL+aWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, May 17, 2017 at 5:58 PM, Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
> From: Sam Voss <samuel.voss@rockwellcollins.com>
>
> Fix bug causing '--enable-linuxgpio' to not work
> due to a misnamed definition. This patch has been
> submitted upstream at https://github.com/kcuzner/avrdude/pull/15.

The upstream portion was merged yesterday, will send a v2 later today
removing it and bumping the version.

Matt
