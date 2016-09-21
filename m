From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 05:53:49 +0200
Subject: [Buildroot] [PATCH 1/2] util-linux: enable libmount for host
 variant
In-Reply-To: <1474403264-16066-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474403264-16066-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160921055349.0e2f3c2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Sep 2016 17:27:43 -0300, Gustavo Zacarias wrote:
> It's a necessary dependency to build the new host-libglib2.
> libblkd is an indirect dependency for libmount.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/util-linux/util-linux.mk | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Both patches applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
