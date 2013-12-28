From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 17:09:00 +0100
Subject: [Buildroot] [PATCH v2 1/1] avrdude: new package
In-Reply-To: <1387924680-16737-1-git-send-email-wzab01@gmail.com>
References: <1387924680-16737-1-git-send-email-wzab01@gmail.com>
Message-ID: <20131228170900.2b49ec6e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wojciech M. Zabolotny,

On Tue, 24 Dec 2013 23:38:00 +0100, Wojciech M. Zabolotny wrote:
> Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
> ---
>  package/Config.in          |  1 +
>  package/avrdude/Config.in  | 16 ++++++++++++++++
>  package/avrdude/avrdude.mk | 18 ++++++++++++++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 package/avrdude/Config.in
>  create mode 100644 package/avrdude/avrdude.mk

Thanks, applied. FYI, I've made the following small modifications:

     - remove empty newline at the end of Config.in
     - use lowercase for the package name in the comment header
     - reword the comment explaining why autoreconf is needed
     - add optional dependency on libftdi, which avrdude can use
     - remove avrdude.conf.bak file from /etc

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
