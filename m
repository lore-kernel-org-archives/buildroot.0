From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 21:25:27 +0100
Subject: [Buildroot] [PATCH 1/2] linux-headers: remove deprecated
 version 3.16.x
In-Reply-To: <1453308820-16940-1-git-send-email-gustavo@zacarias.com.ar>
References: <1453308820-16940-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160120212527.2934b7ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 20 Jan 2016 13:53:39 -0300, Gustavo Zacarias wrote:
> Remove for the upcoming 2016.02 release, it's been deprecated for a year
> now.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  Config.in.legacy                     | 10 ++++++++++
>  package/linux-headers/Config.in.host |  7 -------
>  2 files changed, 10 insertions(+), 7 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
