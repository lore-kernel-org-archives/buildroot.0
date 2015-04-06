From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 11:33:41 +0200
Subject: [Buildroot] [PATCH 00/35] Package based 'source', 'legal-info',
 'source-check' and 'external-deps'
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150406113341.1d61d37b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Mar 2015 19:33:14 +0200, Thomas Petazzoni wrote:

>   packages: apply custom patches using *.patch instead of <pkg>-*.patch
>   docs/manual: update documentation about applying patches
>   pkg-generic: implement a <pkg>-external-deps target
>   pkg-generic: implement <pkg>-all-{source,legal-info,external-deps}
>     targets
>   Makefile: remove dubious comment
>   Makefile: directories are not PHONY targets
>   pkg-generic: declare phony targets as such

Following the reviews from Yann, I've now also applied those patches.
It means that from this series, patches 1 to 14 included are applied.
Patches 15 and beyond are not applied for now.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
