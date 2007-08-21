From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 21 Aug 2007 20:17:30 +0200
Subject: [Buildroot] Error with libusb-0.1.12
In-Reply-To: <1187712505.10375.19.camel@PC-EK.Solcon>
References: <1187712505.10375.19.camel@PC-EK.Solcon>
Message-ID: <20070821181730.GB19089@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 21, 2007 at 06:08:25PM +0200, Emil Kr?per wrote:
>Hej!
>Builtroot stops building with an error, I tried several different
>snapshots from July to August and all break with complaining about
>libtool and unrecognized option `-DHAVE_CONFIG_H'.
>It happens even when I build an almost clean config with the only change
>to libusb enabled. Then I tried the same with 386. No difference, same
>fault.

Builds fine for me (>= r19625). Please confirm
