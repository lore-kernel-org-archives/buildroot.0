From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 18:00:13 +0200
Subject: [Buildroot] [PATCH 1/2] dropwatch: fix build failure with
 binutils 2.23.1+
In-Reply-To: <1375298801-18548-1-git-send-email-gustavo@zacarias.com.ar>
References: <1375298801-18548-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130801180013.6e7fc454@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 31 Jul 2013 16:26:40 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...ch-1.4-build.patch => dropwatch-01-build.patch} |  0
>  .../dropwatch/dropwatch-02-binutils-2.23.1.patch   | 74 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  rename package/dropwatch/{dropwatch-1.4-build.patch => dropwatch-01-build.patch} (100%)
>  create mode 100644 package/dropwatch/dropwatch-02-binutils-2.23.1.patch

Both applied, thanks. The second patch is a bit ugly, but yes, I don't
see how to do it otherwise.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
