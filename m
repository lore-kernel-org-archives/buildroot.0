From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jul 2012 19:06:53 +0200
Subject: [Buildroot] [PATCH] libnfc: bump version to recent svn revision
In-Reply-To: <1342598410-30593-1-git-send-email-spdawson@gmail.com>
References: <1342598410-30593-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120718190653.51a3d42d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 18 Jul 2012 09:00:10 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> The libnfc package is currently at version 1.5.1 in Buildroot. This patch
> bumps the version to a recent svn revision, for the following reasons.
> 
> * Version 1.5.1 is marked as "unstable" on the libnfc download site.
> 
> * The nfc-tools project at
> 
>     http://code.google.com/p/nfc-tools/
> 
>   includes a library that extends libnfc with LLCP functionality.
>   Unfortunately, to build this requires a libnfc version no lower than 1.6.
>   The version 1.6.0-rc1 Release Candidate does not build; svn commits to fix
>   the build problems have not yet been back-ported into a Release Candidate.
> 
> * The libfreefare package is currently at version 0.3.2 in Buildroot. To bump
>   this to the most recent version (0.3.4) also requires a libnfc version no
>   lower than 1.6.
> 
> I suggest that this patch be regarded as a temporary fix, pending the release
> of libnfc 1.6, which will allow other dependent packages to be progressed in
> the interim.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Applied.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
