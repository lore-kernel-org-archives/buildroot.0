From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 16:35:17 +0100
Subject: [Buildroot] [PATCH v4 1/7] bustle: use TARGET_MAKE_ENV instead
 of setting PATH in the make environment
In-Reply-To: <1392559113-5215-2-git-send-email-s.martin49@gmail.com>
References: <1392559113-5215-1-git-send-email-s.martin49@gmail.com>
 <1392559113-5215-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20140218163517.0694c491@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 16 Feb 2014 14:58:27 +0100, Samuel Martin wrote:
> TARGET_MAKE_ENV already contains the PATH definition among other useful
> variables.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
