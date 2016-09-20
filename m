From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 20:20:38 +0200
Subject: [Buildroot] [PATCH 1/7] libglib2: bump to version 2.50.0
In-Reply-To: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160920202038.4b433b91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Sep 2016 12:01:30 -0300, Gustavo Zacarias wrote:
> It now requires util-linux libmount so add the dependency/select.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libglib2/Config.in     | 2 ++
>  package/libglib2/libglib2.hash | 4 ++--
>  package/libglib2/libglib2.mk   | 6 +++---
>  3 files changed, 7 insertions(+), 5 deletions(-)

All applied, thanks!

One more dependency for libglib2, this is really becoming an heavy
package :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
