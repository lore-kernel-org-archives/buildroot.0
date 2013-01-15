From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jan 2013 17:43:24 +0100
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.1.6
In-Reply-To: <1358250886-11786-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358250886-11786-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130115174324.2495486f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 15 Jan 2013 08:54:46 -0300, Gustavo Zacarias wrote:

> -GNUTLS_VERSION = 3.1.5
> +GNUTLS_VERSION = 3.1.6

Not sure if it is caused by this bump or was already present, but we
got a gnutls build failure on avr32:

 http://autobuild.buildroot.org/results/c57d1c89e313779cc7c3aa06382b70058eaffe99/build-end.log

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
