From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jun 2012 22:24:02 +0200
Subject: [Buildroot] [PATCH] freerdp: new package Signed-off-by: Julian
 Lunz <git@jlunz.de>
In-Reply-To: <1338825460-6596-1-git-send-email-git@jlunz.de>
References: <1338825460-6596-1-git-send-email-git@jlunz.de>
Message-ID: <20120605222402.5bb8b156@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon,  4 Jun 2012 17:57:40 +0200,
Julian Lunz <git@jlunz.de> a ?crit :

> ---
>  package/Config.in          |    1 +
>  package/freerdp/Config.in  |   13 +++++++++++++
>  package/freerdp/freerdp.mk |   41 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+), 0 deletions(-)

Thanks, it looks much better. One additional issue: you must put your
Signed-off-by line after one blank line after the commit title, i.e:

"""
freerdp: new package

Signed-off-by: ....
"""

Otherwise, git believes that your Signed-off-by is part of the commit
title, which is not nice.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
