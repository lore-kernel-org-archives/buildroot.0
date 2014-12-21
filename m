From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 21:08:42 +0100
Subject: [Buildroot] [PATCH] iperf3: new package
In-Reply-To: <1418821145-20888-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418821145-20888-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141221210842.1db6d5dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 17 Dec 2014 09:59:05 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                           |  1 +
>  package/iperf3/0001-disable-profiling.patch | 20 ++++++++++++++++++++
>  package/iperf3/Config.in                    | 16 ++++++++++++++++
>  package/iperf3/iperf3.mk                    | 12 ++++++++++++
>  4 files changed, 49 insertions(+)
>  create mode 100644 package/iperf3/0001-disable-profiling.patch
>  create mode 100644 package/iperf3/Config.in
>  create mode 100644 package/iperf3/iperf3.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
