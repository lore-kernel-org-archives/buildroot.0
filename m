From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Mar 2013 18:56:46 +0100
Subject: [Buildroot] [PATCH 2/5] cmake: remove target package macro (not
 really implemented)
In-Reply-To: <1362590066-5448-3-git-send-email-luca@lucaceresoli.net>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
 <1362590066-5448-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <20130306185646.42e08b5c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed,  6 Mar 2013 18:14:23 +0100, Luca Ceresoli wrote:
> CMake is declared as a generic target package, but the corresponding rules
> do not even exist.

This was needed some time ago: the package infrastructures had some
issues when there was a host-<foo> package but no <foo> package. I
think it was fixed by 79bfcd556027901b847cae063cbcfbedf75e394a.

> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
