From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 04 Dec 2009 00:38:22 +0100
Subject: [Buildroot] [PATCH] gst-plugins-bad: make more dependency-less
 plugins configurable
In-Reply-To: <1259879658-7159-1-git-send-email-s.neumann@raumfeld.com>
References: <1259879658-7159-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1259883502.9554.69.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sven,

please consider theses patchs too :

http://lists.busybox.net/pipermail/buildroot/2009-November/030291.html

Regards,

--
Lionel

Le jeudi 03 d?cembre 2009 ? 23:34 +0100, Sven Neumann a ?crit :
> The latest update added a few new plugins that were missing from
> the buildroot configuration system. This commit makes these
> dependency-less plugins configurable.
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
