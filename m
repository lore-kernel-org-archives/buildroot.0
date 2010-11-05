From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Nov 2010 18:00:24 +0100
Subject: [Buildroot] [PATCH 12/21] libogg: bump to 1.2.0
In-Reply-To: <1284864823-18993-13-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
	<1284864823-18993-13-git-send-email-Martin.Banky@gmail.com>
Message-ID: <20101105180024.22884576@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Sep 2010 19:53:34 -0700
Martin Banky <martin.banky@gmail.com> wrote:

>  .../libogg/libogg-1.2.0-buildroot-libtool.patch    |   53 ++++++++++++++++++++

This patch is no longer needed, we now have a better libtool patching
logic that handles properly libtool 2.2. Moreover, version 1.2.1 has
been released in the mean time.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
