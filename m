From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Jan 2013 14:17:30 +0100
Subject: [Buildroot] [PATCH 20/20] support/scripts: add xorg-release.py
	script
In-Reply-To: <87vcbbiyqr.fsf@dell.be.48ers.dk>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <41c1bc2b4f8953280e305deada0b52e432974b58.1357125961.git.thomas.petazzoni@free-electrons.com>
 <87vcbbiyqr.fsf@dell.be.48ers.dk>
Message-ID: <20130105141730.0cd197bf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 05 Jan 2013 13:46:20 +0100, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> This script generates a report on the packaging status of X.org
>  Thomas> releases in Buildroot. It does so by downloading the list of tarballs
>  Thomas> that are part of a given X.org release, and compare that with the
>  Thomas> packages that are available in Buildroot.
> 
> I've dropped the .py suffix to match the other scripts and made it
> executable and committed, thanks.

Indeed, good modifications. Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
