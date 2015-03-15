From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:36:41 +0100
Subject: [Buildroot] [PATCH 00/13] autobuild-run: python3 compat and
 misc improvements
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <20150315143641.3cd7a528@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Erdmann,

On Wed, 25 Feb 2015 22:17:17 +0100, Andr? Erdmann wrote:

> Andr? Erdmann (13):
>   autobuild-run, python3: print is a function
>   autobuild-run, python3: urllib.request<>urllib2
>   autobuild-run, python3: bytes<>str, decode()
>   autobuild-run, python3: configparser<>ConfigParser
>   autobuild-run: remove unneeded vars
>   autobuild-run: explicitly close web file handles
>   autobuild-run: get host arch once
>   autobuild-run: sort imports alphabetically
>   autobuild-run: unify "which <prog>" code
>   autobuild-run: use a built-in has_prog() implementation

I've applied these patches, after making some minor adjustments needed
to make them apply on top of Thomas DS patch series.

>   autobuild-run: move check_requirements() to SystemInfo
>   autobuild-run: encapsulate subprocess calls
>   autobuild-run: set locale to en_US or C

Those ones were conflicting a bit too much. Could you rework them on
top of the latest buildroot-test repository, and resend an updated
version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
