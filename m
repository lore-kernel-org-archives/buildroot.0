From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:49:11 +0100
Subject: [Buildroot] [PATCH v3 0/7] dtc: update and add raspberry pi
 overlay support
In-Reply-To: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
References: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150114204911.2158cece@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 13 Jan 2015 20:40:00 +0100, Peter Seiderer wrote:

> Peter Seiderer (7):
>   dtc: fix project and download url
>   dtc: rename patches to new convention
>   dtc: bump version to 1.4.1
>   dtc: add hash

I've applied those four initial patches.

>   dtc: add host build
>   dtc: add patches for raspberry pi overlay support
>   linux: install dtc only in case package host dtc is not selected

I'm not quite decided about those ones yet.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
