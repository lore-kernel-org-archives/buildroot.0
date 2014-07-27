From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 15:56:13 +0200
Subject: [Buildroot] [PATCH] python-ipython: new package
In-Reply-To: <1406228929-32485-1-git-send-email-eeppeliteloop@gmail.com>
References: <1406228929-32485-1-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <20140727155613.2db1ded5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Philippe Proulx,

On Thu, 24 Jul 2014 15:08:49 -0400, Philippe Proulx wrote:
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> ---
>  package/Config.in                                         |  1 +
>  package/python-ipython/Config.in                          | 10 ++++++++++
>  ...n-ipython-001-set-correct-python-executable-path.patch | 15 +++++++++++++++
>  package/python-ipython/python-ipython.mk                  | 14 ++++++++++++++
>  4 files changed, 40 insertions(+)
>  create mode 100644 package/python-ipython/Config.in
>  create mode 100644 package/python-ipython/python-ipython-001-set-correct-python-executable-path.patch
>  create mode 100644 package/python-ipython/python-ipython.mk

Thanks, patch applied.

However, out of curiosity, I wonder what this package is used for on
embedded systems? It weights 12+ MB, so it's quite huge.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
