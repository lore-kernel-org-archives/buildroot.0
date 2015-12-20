From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 15:26:05 +0100
Subject: [Buildroot] [PATCH 0/3] linux: Fix appended DTB image generation
In-Reply-To: <1445202302-2720-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445202302-2720-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151220152605.26fc3fbe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Oct 2015 23:04:59 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (3):
>   linux: de-duplicate DTB and Linux image installation
>   linux: only install the DTBs when not in appended DTB mode
>   linux: don't build appended DTB image in place and support multiple
>     images

Series applied. I didn't get much review, except Peter saying "Other
than that the series look good to me!", and the series has been around
for 2+ months, so I applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
