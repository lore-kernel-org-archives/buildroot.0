From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 May 2013 17:24:12 +0200
Subject: [Buildroot] [PATCH v3 00/11] ARC port
In-Reply-To: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
References: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
Message-ID: <20130502172412.6ce3463d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Thu,  2 May 2013 15:00:39 +0200, Mischa Jonker wrote:

> Changes in v3:
>  * removed GCC arch-dependency cleanup patch (should be discussed separately)
>  * 3.9-rc8-->3.9 kernel headers
>  * Added bison/flex host dependencies

Hum, what happened to the gcc changes to have the host-bison/host-flex
dependencies, and the changes to make sure that $(HOST_DIR)/usr/bin is
in the PATH when building gcc?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
