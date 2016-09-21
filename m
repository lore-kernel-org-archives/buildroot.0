From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 14:11:48 +0200
Subject: [Buildroot] [PATCH 1/7] libglib2: bump to version 2.50.0
In-Reply-To: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160921141148.3aedf147@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Sep 2016 12:01:30 -0300, Gustavo Zacarias wrote:
> It now requires util-linux libmount so add the dependency/select.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

With this new version, the crc32 symbol gets defined twice in static
linking scenarios. See
http://autobuild.buildroot.net/results/c26/c2602f2e9db665d5a1d7cea8f3256099ce34a527/build-end.log

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
