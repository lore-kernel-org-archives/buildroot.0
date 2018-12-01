From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 21:46:08 +0100
Subject: [Buildroot] [PATCH 2/2] quagga: zebra needs dynamic library
In-Reply-To: <20181201183151.3853-2-fontaine.fabrice@gmail.com>
References: <20181201183151.3853-1-fontaine.fabrice@gmail.com>
 <20181201183151.3853-2-fontaine.fabrice@gmail.com>
Message-ID: <20181201214608.562738c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Dec 2018 19:31:51 +0100, Fabrice Fontaine wrote:
> zebra library defines optind and opterr which are already defined in
> libc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/32f93a73379d073abcaf8936ffbb8b5707583024

Meh, can't we just rename those variables ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
