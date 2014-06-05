From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 05 Jun 2014 08:32:08 -0300
Subject: [Buildroot] [PATCH] hostapd: bump to version 2.2
In-Reply-To: <a2d2ff5ac6c66d5ee3369224d818db5b5869c475.1401963749.git.baruch@tkos.co.il>
References: <a2d2ff5ac6c66d5ee3369224d818db5b5869c475.1401963749.git.baruch@tkos.co.il>
Message-ID: <53905538.2020907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/05/2014 07:22 AM, Baruch Siach wrote:

> Drop upstream patch.

You can also drop the CONFIG_IEEE80211W setting since it's now default y
and redundant.
Regards.
