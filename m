From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Nov 2009 12:44:21 -0300
Subject: [Buildroot] [PATCH] Add fuse-sshfs package
In-Reply-To: <1259073650-3843-1-git-send-email-daniel@caiaq.de>
References: <1259073650-3843-1-git-send-email-daniel@caiaq.de>
Message-ID: <4B0BFF55.2090805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel Mack wrote:

> +SSHFS_DEPENDENCIES = uclibc libglib2

Hmmm... doesn't it depend on a userland ssh client (like openssh, maybe
dropbear) to keep an open connection/pipe?
Regards.
