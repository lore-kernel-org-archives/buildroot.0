From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:36:43 +0200
Subject: [Buildroot] [PATCH v8 08/14] support/scripts: update
 check-host-rpath to use the shell helpers
In-Reply-To: <1460929111-15615-9-git-send-email-s.martin49@gmail.com>
References: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
 <1460929111-15615-9-git-send-email-s.martin49@gmail.com>
Message-ID: <20160418213643.57e1a8e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

So the commit title says that you update check-host-rpath to use the
shell helpers...

On Sun, 17 Apr 2016 23:38:25 +0200, Samuel Martin wrote:

>  support/scripts/check-host-rpath | 73 +++++++++++++++-------------------------
>  support/scripts/shell/readelf.sh | 69 +++++++++++++++++++++++++++++++++++++

but in practice, you also add a lot of new functions to the shell
helpers.

Either this is intended and it should be mentioned in the commit log,
or it is not intended.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
