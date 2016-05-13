From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:35:26 +0200
Subject: [Buildroot] [PATCH 1/2] python-flask-jsonrpc: new package
In-Reply-To: <1462975669-18032-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1462975669-18032-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20160513223526.50f5264d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 May 2016 16:07:48 +0200, S?bastien Szymanski wrote:
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  package/Config.in                                      |  1 +
>  package/python-flask-jsonrpc/Config.in                 |  7 +++++++
>  package/python-flask-jsonrpc/python-flask-jsonrpc.hash |  3 +++
>  package/python-flask-jsonrpc/python-flask-jsonrpc.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-flask-jsonrpc/Config.in
>  create mode 100644 package/python-flask-jsonrpc/python-flask-jsonrpc.hash
>  create mode 100644 package/python-flask-jsonrpc/python-flask-jsonrpc.mk

I've applied to next, after doing the following changes:

    [Thomas:
     - make python-flask a runtime dependency only, as noticed by Yegor
       Yefremov.
     - use setup.py as the license file.]

Thanks for the contribution, and thanks Yegor for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
