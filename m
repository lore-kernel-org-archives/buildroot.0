From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 27 Apr 2015 08:38:24 +0200
Subject: [Buildroot] Reminder about your pending Buildroot patches
In-Reply-To: <20150421125630.D7AF788E@mail.free-electrons.com>
References: <20150421125630.D7AF788E@mail.free-electrons.com>
Message-ID: <CAHkwnC-D84r+EWg0_0-3n638WyL89rcoF3uKLO9+UPPZg8dygw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 21, 2015 at 2:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This is a reminder about your Buildroot patches that are older than 30
> days.
>
> We need your help to know if your patches are still relevant or not.
> To help us, make sure to update the status of your patches in
> patchwork as appropriate, or to resend an updated version that applies
> on the latest Buildroot master. Especially let us know if you would
> like to withdraw your patch if you are no longer interested.
>
> Here is the list of patches you have submitted that are still pending:
>
>  - [v2] automake: use whenever possible the ACLOCAL_HOST_DIR variable
>    http://patchwork.ozlabs.org/patch/437690/

Still valid for me, it's a refactoring change so the behavior doesn't change.

>  - [RFC,v3,01/30] rtmpdump: use TARGET_LDFLAGS instead of TARGET_CFLAGS for XLDFLAGS
>    http://patchwork.ozlabs.org/patch/445586/
>
>  - [RFC,v3,02/30] xinetd: use TARGET_LDFLAGS in order to support per-package staging
>    http://patchwork.ozlabs.org/patch/445585/
>
>  - [RFC,v3,03/30] iproute2: use the TARGET_LDFLAGS variable
>    http://patchwork.ozlabs.org/patch/445590/
>
>  - [RFC,v3,04/30] opentyrian: use TARGET_LDFLAGS
>    http://patchwork.ozlabs.org/patch/445587/
>
>  - [RFC,v3,05/30] pppd: use TARGET_LDFLAGS
>    http://patchwork.ozlabs.org/patch/445588/
>
>  - [RFC,v3,06/30] openswan: set LDFLAGS
>    http://patchwork.ozlabs.org/patch/445589/
>
>  - [RFC,v3,07/30] exim: use TARGET_LDFLAGS
>    http://patchwork.ozlabs.org/patch/445592/
>
>  - [RFC,v3,08/30] fbv: use TARGET_LDFLAGS
>    http://patchwork.ozlabs.org/patch/445594/
>
>  - [RFC,v3,09/30] cups: use TARGET_LDFLAGS
>    http://patchwork.ozlabs.org/patch/445591/
>
>  - [RFC,v3,10/30] faifa: use TARGET_LDFLAGS
>    http://patchwork.ozlabs.org/patch/445593/
>
>  - [RFC,v3,11/30] iw: use TARGET_CONFIGURE_OPTS
>    http://patchwork.ozlabs.org/patch/445595/
>
>  - [RFC,v3,12/30] dhcpdump: use TARGET_CONFIGURE_OPTS in order to support PPS
>    http://patchwork.ozlabs.org/patch/445597/
>
>  - [RFC,v3,13/30] dtc: add add support for per-package staging directory
>    http://patchwork.ozlabs.org/patch/445596/
>
>  - [RFC,v3,14/30] openssh: add support to the per-package staging directory.
>    http://patchwork.ozlabs.org/patch/445598/
>
>  - [RFC,v3,15/30] mjpg-streamer: add support for the per-package staging directory
>    http://patchwork.ozlabs.org/patch/445599/
>
>  - [RFC,v3,16/30] tcpreplay: delay the execution of pcap-config
>    http://patchwork.ozlabs.org/patch/445600/
>
>  - [RFC,v3,17/30] erlang: add support for the per-package staging directory
>    http://patchwork.ozlabs.org/patch/445602/
>
>  - [RFC,v3,18/30] perl: don't loose the -shared flag when TARGET_LDFLAGS isn't empty
>    http://patchwork.ozlabs.org/patch/445601/
>
>  - [RFC,v3,19/30] erlang-p1-iconv: bump to a version that use TARGET_CFLAGS
>    http://patchwork.ozlabs.org/patch/445603/
>
>  - [RFC,v3,20/30] erlang-p1-zlib: bump to a version that use TARGET_CFLAGS
>    http://patchwork.ozlabs.org/patch/445606/
>
>  - [RFC,v3,21/30] lmbench: to be checked
>    http://patchwork.ozlabs.org/patch/445604/
>
>  - [RFC,v3,22/30] Makefile: add the STAGINGNOPKG_DIR variable
>    http://patchwork.ozlabs.org/patch/445607/
>
>  - [RFC,v3,23/30] gpsd: add support for per-package staging directory
>    http://patchwork.ozlabs.org/patch/445605/
>
>  - [RFC,v3,24/30] triggerhappy: add support for per-package staging directory
>    http://patchwork.ozlabs.org/patch/445609/
>
>  - [RFC,v3,25/30] ipsec-tools: add support for per-package staging directory
>    http://patchwork.ozlabs.org/patch/445608/
>
>  - [RFC,v3,26/30] pkg-cmake: add support for per-package staging directory
>    http://patchwork.ozlabs.org/patch/445613/
>
>  - [RFC,v3,27/30] pkg-luarocks: add support for per-package staging directory
>    http://patchwork.ozlabs.org/patch/445614/
>
>  - [RFC,v3,28/30] pkgconf: Move PKG_CONFIG_HOST_BINARY to Makefile.in
>    http://patchwork.ozlabs.org/patch/445610/
>
>  - [RFC,v3,29/30] pkg-generic: ADD_TOOLCHAIN_DEPENDENCY is true only for target packages
>    http://patchwork.ozlabs.org/patch/445611/
>
>  - [RFC,v3,30/30] pkg-generic: add support for per-package staging directory
>    http://patchwork.ozlabs.org/patch/445612/


As suggested i'm working on using the external toolchain wrapper to
set the sysroot, so I've maked this patch set as "Changes Requested".


IMHO there are other patches ready to be merged:

packages: fix and improve support for top-level parallel makefile
http://patchwork.ozlabs.org/patch/458382/

giflib: remove from the description the reference to libungif
http://patchwork.ozlabs.org/patch/460474/

1/4 support/download/cvs: add support to use a date instead of a tag
http://patchwork.ozlabs.org/patch/464749/

2/4 manual: cvs: document that a date can be used instead of a tag
http://patchwork.ozlabs.org/patch/464750/

3/4 expect: bump to version 5.45.3
http://patchwork.ozlabs.org/patch/464751/

4/4 manual: don't use a comment at the end of the version variable assignment
http://patchwork.ozlabs.org/patch/464752/

Thanks and best regards
-- 
Fabio Porcedda
