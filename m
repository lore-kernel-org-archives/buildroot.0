From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Apr 2013 10:45:23 +0200
Subject: [Buildroot] [git commit] xkeyboard-config: make available
 outside of X.org, reduce dependencies
In-Reply-To: <20130430081120.2FC3C97287@busybox.osuosl.org>
References: <20130430081120.2FC3C97287@busybox.osuosl.org>
Message-ID: <20130430104523.0eaf44b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 29 Apr 2013 23:00:56 +0200, Peter Korsgaard wrote:

> +XKEYBOARD_CONFIG_LICENSE = MIT
> +XKEYBAORD_CONFIG_LICENSE_FILES = COPYING

     ^^^^^^^
     dammit, typo here.

Do you want a patch or can you fix directly?

Sorry for the mess,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
