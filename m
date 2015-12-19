From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:06:10 +0100
Subject: [Buildroot] [PATCH 3/3] cantarell: new package
In-Reply-To: <1447443425-2530-3-git-send-email-gustavo@zacarias.com.ar>
References: <1447443425-2530-1-git-send-email-gustavo@zacarias.com.ar>
 <1447443425-2530-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151219150610.1c713db4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 13 Nov 2015 16:37:05 -0300, Gustavo Zacarias wrote:

> +CANTARELL_LICENSE = SILv1.1

This should have been 'OFLv1.1', since it is what the liberation
package is using, and is closer to the SPDX code for this license.

Committed with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
