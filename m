From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 17:46:15 +0100
Subject: [Buildroot] ssh-copy-id
In-Reply-To: <SNT119-W63CFD1FA0F757DC16BC53C82120@phx.gbl>
References: <SNT119-W63CFD1FA0F757DC16BC53C82120@phx.gbl>
Message-ID: <20101213174615.491fdba7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Dec 2010 10:07:44 +0000
Johnny Beardsmore <jny0@hotmail.com> wrote:

> Is there a ssh-copy-id option in Buildroot?  If so, where is it?

It is part of OpenSSH, which is packaged in Networking applications ->
openssh in Buildroot.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
