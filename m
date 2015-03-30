From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:42:08 +0200
Subject: [Buildroot] [PATCH 00/35] Package based 'source', 'legal-info',
 'source-check' and 'external-deps'
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150330234208.5c1d7684@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Mar 2015 19:33:14 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (35):
>   linux: use the package infrastructure to download patches
>   pkg-generic: fix the logic showing the "Downloading" message
>   pkg-generic: take into account <pkg>_EXTRA_DOWNLOADS to display
>     "Downloading" message
>   pkg-generic: refactor the "Downloading" message logic
>   pkg-generic: allow full URLs for <pkg>_EXTRA_DOWNLOADS
>   docs/manual: update documentation about <pkg>_SOURCE, <pkg>_PATCH and
>     <pkg>_EXTRA_DOWNLOADS
>   perl: use <pkg>_EXTRA_DOWNLOADS

I've applied those 7 first patches, since they were part of the
previous smaller version of the patch series. For the remaining
patches, I'll give a bit more time for people to react before applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
