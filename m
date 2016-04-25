From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 22:14:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/openjpeg: bump to version 2.1
In-Reply-To: <CA+TH9Vkf-=t2iS7ep1J3ejZ+LREVprQ+AN6wNn39MDAYVV58uw@mail.gmail.com>
References: <1461597623-14629-1-git-send-email-angelo.compagnucci@gmail.com>
 <1461597623-14629-2-git-send-email-angelo.compagnucci@gmail.com>
 <20160425212827.07703ac2@free-electrons.com>
 <CA+TH9Vkf-=t2iS7ep1J3ejZ+LREVprQ+AN6wNn39MDAYVV58uw@mail.gmail.com>
Message-ID: <20160425221455.36312295@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 22:05:44 +0200, Angelo Compagnucci wrote:

> > What about those optional dependencies? They are no longer used?
> 
> They are no longer present as cmake options, they are handled internally.

What do you mean by "internally"? They are still optional dependencies,
but there are no CMake options to enable/disable them? The libpng, tiff
and lcms2 code has been duplicated in the openjpeg project?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
