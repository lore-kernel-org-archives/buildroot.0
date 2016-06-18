From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:19:48 +0200
Subject: [Buildroot] [PATCH 1/3] libfastjson: new package
In-Reply-To: <1465996668-6444-1-git-send-email-peter@korsgaard.com>
References: <1465996668-6444-1-git-send-email-peter@korsgaard.com>
Message-ID: <20160618151948.0822983d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Jun 2016 15:17:46 +0200, Peter Korsgaard wrote:
> Libfastjson is a fork of json-c, and a dependency of newer versions of
> rsyslog.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Config.in                    |  1 +
>  package/libfastjson/Config.in        | 16 ++++++++++++++++
>  package/libfastjson/libfastjson.hash |  2 ++
>  package/libfastjson/libfastjson.mk   | 15 +++++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100644 package/libfastjson/Config.in
>  create mode 100644 package/libfastjson/libfastjson.hash
>  create mode 100644 package/libfastjson/libfastjson.mk

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
