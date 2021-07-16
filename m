From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:15:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.33.1
In-Reply-To: <20210716031025.1524809-1-james.hilliard1@gmail.com>
References: <20210716031025.1524809-1-james.hilliard1@gmail.com>
Message-ID: <20210716231503.48f47eea@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 15 Jul 2021 21:10:25 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> +NETWORK_MANAGER_VERSION_MAJOR = 1.33

Isn't 1.33 a development branch/release ?
https://wiki.gnome.org/Projects/NetworkManager is not very clear when
it says "Major NetworkManager releases are numbered 1.y.0, with y being
an even number. For example, 1.0.0, 1.2.0, ..., 1.18.0. Minor stable
releases are numbered 1.y.z, with y and z being even numbers. For
example 1.4.2, 1.18.2.".

However, the NEWS file at
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/main/NEWS
says:

=============================================
NetworkManager-1.34
Overview of changes since NetworkManager-1.32
=============================================

This is a snapshot of NetworkManager development. The API is
subject to change and not guaranteed to be compatible with
the later release.
USE AT YOUR OWN RISK.  NOT RECOMMENDED FOR PRODUCTION USE!

So they don't even mention 1.33.

Another point: as we're updating from 1.22 to 1.32 (potentially), is
just a simple bump sufficient? Aren't there new options/features that
should be taken into account ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
