From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 23:17:54 +0100
Subject: [Buildroot] [PATCH 1/1] iotop: new package
In-Reply-To: <1426157631-5598-1-git-send-email-cvubrugier@fastmail.fm>
References: <1426157631-5598-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20150313231754.51eda9f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Thu, 12 Mar 2015 11:53:51 +0100, Christophe Vu-Brugier wrote:
> iotop does for I/O usage what top does for CPU usage.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  package/Config.in                                  |  1 +
>  .../iotop/0001-Fix-build-error-with-Python-3.patch | 37 ++++++++++++++++++++++
>  package/iotop/Config.in                            | 12 +++++++
>  package/iotop/iotop.mk                             | 13 ++++++++
>  4 files changed, 63 insertions(+)
>  create mode 100644 package/iotop/0001-Fix-build-error-with-Python-3.patch
>  create mode 100644 package/iotop/Config.in
>  create mode 100644 package/iotop/iotop.mk

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
