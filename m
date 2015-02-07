From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Feb 2015 11:15:12 +0100
Subject: [Buildroot] Float error on SAMA5D3 Xplained using nodejs
In-Reply-To: <WC20141208113028.33021D@til-technologies.fr>
References: <WC20141205121112.0100A6@til-technologies.fr>
 <20141205140135.606fff5a@free-electrons.com>
 <WC20141205142813.1900F2@til-technologies.fr>
 <20141205153931.722cd4c1@free-electrons.com>
 <WC20141208113028.33021D@til-technologies.fr>
Message-ID: <20150207111512.44a60803@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear C?dric HEYMAN,

On Mon, 08 Dec 2014 12:30:28 +0100, C?dric HEYMAN wrote:

> Unfortunately, we are not using git on our buildroot-2014.11 repository as I 
> got the corresponding tarball to install it, and we actually archive under 
> SVN on an internal server.
> 
> Is there another simple way to submit patch ?

This issue has been fixed in commit
4f09b5b484af374b86af0db9e171f22fffffc8f0.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
