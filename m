From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 22:45:43 +0200
Subject: [Buildroot] [PATCH 1/1] Fix config.mak.uname to allow
 cross-compilation
In-Reply-To: <2b22b774-92fe-c855-0c6e-af916a93dd30@mclink.it>
References: <1463948643-21344-1-git-send-email-mc5686@mclink.it>
 <1463948643-21344-2-git-send-email-mc5686@mclink.it>
 <20160522222942.37041c37@free-electrons.com>
 <2b22b774-92fe-c855-0c6e-af916a93dd30@mclink.it>
Message-ID: <20160522224543.7fc83f9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 May 2016 22:40:04 +0200, Mauro Condarelli wrote:

> > This patch cannot be applied, as it is a patch against Git directly,
> > while you should send patches against Buildroot. I.e, a patch that adds
> > a patch.  
> I know.
> My patchset for BuildRoot is in "[Buildroot] [PATCH v2] Fix for GIT cross-compilation."
> and includes this patch.
> I sent this upstream and it's CC: here only FYI.

Ah, OK, I understand. You didn't break any rule, but I did not realize
this patch was for Git upstream and not for Buildroot :/

Thomsa
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
