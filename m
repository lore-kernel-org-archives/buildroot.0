From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Sep 2010 14:03:40 +0200
Subject: [Buildroot] [RESEND/PATCH] Git/Svn downloaders
In-Reply-To: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <20100902140340.5fb956d9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Sep 2010 12:09:43 +0200
Maxime Petazzoni <maxime.petazzoni@bulix.org> wrote:

> Now that Buildroot 2010.08 is out (nice work on the release by the
> way!), I've rebased my patchset for Git and Subversion downloaders on
> the latest HEAD.
> 
> I've also renamed SPIDER_MODE to DL_MODE, which better represents
> what this variable is for (per Thomas' recommendation).

FWIW, I've pushed this patch set at:

 http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=for-2010.11/download-rework

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
