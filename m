From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Nov 2018 23:34:33 +0100
Subject: [Buildroot] [PATCH v2] package/libid3tag: add .pc file and
 install to staging hook
In-Reply-To: <20181105182701.5646-1-joerg.krause@embedded.rocks>
References: <20181105182701.5646-1-joerg.krause@embedded.rocks>
Message-ID: <1113fd54-c5fd-19ba-3dac-94e89fe24658@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/11/2018 19:27, J?rg Krause wrote:
> The MPD project dropped autotools support in version 0.21.x in favor of
> meson. While adapting the package to the meson build infrastructure, the
> recognition of libid3tag failed, as only pkg-config is used to detect
> the library. Note, that the version bump of the mpd package to 0.21.x is
> not submitted, yet.
> 
> To help finding the build system to detect libid3tag with pkg-config
> properly, add a .pc file and install it to staging.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

 I've added a note that Fedora and Debian do exactly the same (they add their
own .pc file) and applied to next, thanks.

 Regards,
 Arnout
