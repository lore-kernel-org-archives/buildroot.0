From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 09:48:02 +0200
Subject: [Buildroot] [PATCH v3] package/python-web2py: cleaning for
 space saving
In-Reply-To: <1438066220-7019-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1438066220-7019-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150728094802.23897950@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Tue, 28 Jul 2015 08:50:20 +0200, Angelo Compagnucci wrote:

> -define PYTHON_WEB2PY_INSTALL_INIT_SYSV
> -	$(INSTALL) -m 0755 -D package/python-web2py/S51web2py \
> -		$(TARGET_DIR)/etc/init.d/S51web2py

Why do you remove those lines? You don't want to install the init
script anymore?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
