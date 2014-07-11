From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Jul 2014 16:21:48 -0300
Subject: [Buildroot] [PATCH] busybox: fix interaction with version
 selection removal and lzo fix
In-Reply-To: <1405101858-15879-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1405101858-15879-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <53C0394C.9040500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/2014 03:04 PM, Thomas Petazzoni wrote:

> The fix for the LZO issue in Busybox was merged between the moment the
> patch removing the Busybox version selection was posted and
> merged. This patch adjusts the Busybox patches to take into account
> this issue: it removes the LZO patches for the no-longer existing
> Busybox versions, and moves the LZO fix for the 1.22.1 Busybox version
> as appropriate.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
