From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 11:45:14 +0200
Subject: [Buildroot] [PATCH v5 1/1] tovid: new package
In-Reply-To: <1427038513-5368-1-git-send-email-skenton@ou.edu>
References: <1427038513-5368-1-git-send-email-skenton@ou.edu>
Message-ID: <20150405114514.355707a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Sun, 22 Mar 2015 10:35:13 -0500, Steve Kenton wrote:
> The tovid suite, also known simply as tovid, is a collection of shell
> and Python scripts for creating DVDs and (S)VCDs. It is pronounced
> "to vid" (because it converts to video disc formats).
> 
> Signed-off-by: Steve Kenton <skenton@ou.edu>

Applied, with some minor changes:

    [Thomas:
      - remove largefile dependency
      - properly propagate mplayer and ffmpeg dependencies.
      - fix license: it's GPLv2+, not GPLv2.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
