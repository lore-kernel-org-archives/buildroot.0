From: Michael Hunold <hunold@linuxtv.org>
Date: Tue, 30 Oct 2007 14:54:10 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  kismet
In-Reply-To: <20071030091652.2D272A67F9@busybox.net>
References: <20071030091652.2D272A67F9@busybox.net>
Message-ID: <47273782.1000900@linuxtv.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

on 30.10.2007 10:16 thomasez at uclibc.org said the following:
> Author: thomasez
> Date: 2007-10-30 02:16:51 -0700 (Tue, 30 Oct 2007)
> New Revision: 20329
> 
> Log:
> Adding Kismet, closing #1557
> 
> 
> Added:
>    trunk/buildroot/package/kismet/
>    trunk/buildroot/package/kismet/Config.in
>    trunk/buildroot/package/kismet/kismet.mk
> 
> Modified:
>    trunk/buildroot/package/Config.in

Something is wrong now. Buildroot wants to unconditionally download the
kismet sources even if Kismet was not selected at all.

Best regards
Michael.
