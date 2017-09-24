From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:31:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/openobex: bump version to 1.7.2
In-Reply-To: <20170916151535.2948-1-bernd.kuhls@t-online.de>
References: <20170916151535.2948-1-bernd.kuhls@t-online.de>
Message-ID: <6136aaf6-6e56-95ab-0967-d90287f47864@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-09-17 17:15, Bernd Kuhls wrote:
> Package switched to cmake without providing most of the autoconf
> options previously available. Therefore we move all suboptions to
> Config.in.legacy.
> 
> All patches are removed, the files to be patched do not exist anymore.
> 
> OPENOBEX_EXTRACT_CMDS is not needed anymore, upstream provides the
> source as .tar.gz now.
> 
> Version 1.6 added support for libusb-1.x and udev. The current version
> also supports bluez5_utils, not only bluez_utils.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks. I also added some help text to the legacy options.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
