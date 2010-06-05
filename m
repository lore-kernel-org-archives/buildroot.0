From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Jun 2010 00:46:17 +0200
Subject: [Buildroot] [git commit master] New lua module: rings
In-Reply-To: <20100605201724.E44C39BFB0@busybox.osuosl.org>
References: <20100605201724.E44C39BFB0@busybox.osuosl.org>
Message-ID: <20100606004617.66ced1ec@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 5 Jun 2010 22:16:11 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

>  package/Config.in       |    1 +
>  package/rings/Config.in |    7 +++++++
>  package/rings/rings.mk  |   29 +++++++++++++++++++++++++++++

This package in particular, and other Lua packages as well have fairly
generic names. Wouldn't it be better to create a lua/ subdirectory with
all the lua related packages ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
