From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:50:05 +0200
Subject: [Buildroot] [PATCH] bash: fix static build
In-Reply-To: <1376313345-5992-1-git-send-email-gustavo@zacarias.com.ar>
References: <1376313345-5992-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130813115005.0537bc72@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 12 Aug 2013 10:15:45 -0300, Gustavo Zacarias wrote:
> The static build needs some trickery, so make it happen. Fixes:
> http://autobuild.buildroot.net/results/2b12868f8297a96d7abf7fcf526ca5eace73d66d/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bash/bash.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
