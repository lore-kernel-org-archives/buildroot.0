From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sat, 24 Nov 2018 20:24:49 +0100
Subject: [Buildroot] [PATCH v2] package/libtool: Reduce target package
 to libltdl only
In-Reply-To: <20181124184708.GB20308@scaer>
References: <20181124165434.31651-1-alexander.sverdlin@gmail.com>
 <20181124184708.GB20308@scaer>
Message-ID: <20181124202449.f5e76e6ac1ae0bf88d997a8a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On Sat, 24 Nov 2018 19:47:08 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > -LIBTOOL_CONF_ENV = HELP2MAN=true
> 
> I guess HELP2MAN is no longer needed because there is no doc to build in
> the libltdl subdir, right?

Correct.

-- 
Alexander Sverdlin.
