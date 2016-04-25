From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 22:35:17 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-pillow: new package
In-Reply-To: <1461597623-14629-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1461597623-14629-1-git-send-email-angelo.compagnucci@gmail.com>
 <1461597623-14629-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160425223517.1d98abb3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 17:20:23 +0200, Angelo Compagnucci wrote:
> This patch adds python pillow, the friendly python fork.
> The accompaining patch to disable platform guessing was submitted
> upstream for inclusion.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Since you're sending it in a series after the openjpeg patch, should we
assume that this version of the python-pillow package requires the new
version of openjpeg?

You posted other patches for python-pillow in the past, but without an
update for openjpeg, so I'd prefer to ask, so that we can see if
python-pillow can be merged independently from the openjpeg update.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
