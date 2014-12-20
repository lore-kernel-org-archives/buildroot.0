From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 21:57:59 +0100
Subject: [Buildroot] [PATCH] python-enum: new package
In-Reply-To: <1418653932-6341-1-git-send-email-peter@korsgaard.com>
References: <1418653932-6341-1-git-send-email-peter@korsgaard.com>
Message-ID: <20141220215759.52c3fef9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 15 Dec 2014 15:32:12 +0100, Peter Korsgaard wrote:
> This is an alternative to python-enum34 with a somewhat different API.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Config.in                    |  1 +
>  package/python-enum/Config.in        | 12 ++++++++++++
>  package/python-enum/python-enum.hash |  3 +++
>  package/python-enum/python-enum.mk   | 14 ++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/python-enum/Config.in
>  create mode 100644 package/python-enum/python-enum.hash
>  create mode 100644 package/python-enum/python-enum.mk

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
