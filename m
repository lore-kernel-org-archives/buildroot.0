From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 18:16:09 +0200
Subject: [Buildroot] [PATCH] cannelloni: needs gcc >= 4.8
In-Reply-To: <1459421651-2869-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459421651-2869-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160331181609.1e329774@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Mar 2016 07:54:11 -0300, Gustavo Zacarias wrote:
> Uses C++11, fixes:
> http://autobuild.buildroot.net/results/4a9/4a9999555c20e495d4981deafc2960940e67febe/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/cannelloni/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
