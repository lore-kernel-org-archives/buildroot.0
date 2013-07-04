From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Jul 2013 15:35:48 +0200
Subject: [Buildroot] [PATCH] linux-headers: switch to xz format
In-Reply-To: <1372935038-28722-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372935038-28722-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130704153548.2d982a19@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  4 Jul 2013 07:50:38 -0300, Gustavo Zacarias wrote:
> The headers and kernels where changed to XZ format on commit
> 98b5cc3eb4d4103b2149325b98a5e93e68c68dd8, but the headers reverted back
> to bz2 on the packaging of the toolchain.

Gaah, thanks, indeed. Sorry for the mis-merge, it has been quite
challenging to rebase my toolchain changes, since it was each time
causing huge conflicts, amongst which it was hard to make sure I
re-applied all the changes that had been made on toolchain/.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
