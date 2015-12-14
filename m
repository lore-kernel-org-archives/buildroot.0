From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2015 15:06:41 +0100
Subject: [Buildroot] [PATCH 03/45] gst1-plugins-base: comma separate
 licenses
In-Reply-To: <1450098684-17399-4-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
 <1450098684-17399-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151214150641.35efe163@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 14 Dec 2015 10:10:42 -0300, Gustavo Zacarias wrote:

> -GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
> +GST1_PLUGINS_BAD_LICENSE_FILES = COPYING, COPYING.LIB

Wrong: the list of license files is space separated, not comma
separated.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
