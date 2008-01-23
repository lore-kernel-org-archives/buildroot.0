From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 23 Jan 2008 18:41:49 +0100
Subject: [Buildroot] Is there any way for buildroot to test
	file	transfer access?
In-Reply-To: <1CD05B980C94AC408B37C82BBABAA3E609CEA2AE@mtsexchange.dc.multitech.prv>
References: <1CD05B980C94AC408B37C82BBABAA3E609CEA2AE@mtsexchange.dc.multitech.prv>
Message-ID: <20080123174149.GA21971@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 23, 2008 at 09:40:57AM -0600, Tim Barr wrote:
>Does buildroot have any command line function that goes through and
>checks all the locations it needs to download files from in order to
>verify that it has access to them? My IT blocks websites on the
>firewall, and I have had my make file fail twice because websites were
>blocked.
> 
>Or maybe you could publish a list on your website that shows all the
>urls that need to be accessed?

$ make help
Cleaning:
  clean                  - delete temporary files created by build
  distclean              - delete all non-source files (including .config)

Build:
  all                    - make world

Configuration:
  menuconfig             - interactive curses-based configurator
  oldconfig              - resolve any unresolved symbols in .config

Miscellaneous:
  source                 - download all sources needed for offline-build
  source-check           - check all packages for valid download URLs

See docs/README and docs/buildroot.html for further details
