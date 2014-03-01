From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 23:47:08 +0100
Subject: [Buildroot] [PATCH v5 1/4] bustle: use TARGET_MAKE_ENV instead
 of setting PATH in the make environment
In-Reply-To: <1393703951-7059-2-git-send-email-s.martin49@gmail.com>
References: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
 <1393703951-7059-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20140301234708.64ecf8c0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sat,  1 Mar 2014 20:59:08 +0100, Samuel Martin wrote:
> TARGET_MAKE_ENV already contains the PATH definition among other useful
> variables.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks.

For the other patches, I'll wait for some other people to do some
review.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
