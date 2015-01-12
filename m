From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 23:04:53 +0100
Subject: [Buildroot] [PATCHv4 3/4] ifupdown: new package
In-Reply-To: <1417107630-14909-4-git-send-email-gustavo@zacarias.com.ar>
References: <1417107630-14909-1-git-send-email-gustavo@zacarias.com.ar>
 <1417107630-14909-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150112230453.16b1aa68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 27 Nov 2014 14:00:29 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                                  |  3 +++
>  .../ifupdown/0001-dont-use-dpkg-architecture.patch | 17 ++++++++++++++
>  package/ifupdown/Config.in                         | 17 ++++++++++++++
>  package/ifupdown/ifupdown.hash                     |  2 ++
>  package/ifupdown/ifupdown.mk                       | 26 ++++++++++++++++++++++
>  5 files changed, 65 insertions(+)
>  create mode 100644 package/ifupdown/0001-dont-use-dpkg-architecture.patch
>  create mode 100644 package/ifupdown/Config.in
>  create mode 100644 package/ifupdown/ifupdown.hash
>  create mode 100644 package/ifupdown/ifupdown.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
