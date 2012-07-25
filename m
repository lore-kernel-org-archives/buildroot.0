From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 18:28:21 +0200
Subject: [Buildroot] [PATCH] gnutls: requires WCHAR support
In-Reply-To: <1343202779-18144-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1343202779-18144-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20120725182821.5eafbdca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 09:52:59 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> gnutls uses wctomb(), which is available only on C libraries with
> wide-char support. This fixes the following build failure:
> 
>  http://autobuild.buildroot.org/results/cd4e73be80fbb64858f4cf911d2b893b0fc06465/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
