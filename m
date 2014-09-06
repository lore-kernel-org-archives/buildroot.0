From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 6 Sep 2014 11:13:12 -0300
Subject: [Buildroot] [autobuild.buildroot.net] nios2 build results for
	2014-09-05
In-Reply-To: <20140906063010.F1253101275@stock.ovh.net>
References: <20140906063010.F1253101275@stock.ovh.net>
Message-ID: <CAAEAJfD4eNUAZF9bNV+tWNghFw-pe5qmeAJoZuzMsbASZuAuVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6 September 2014 03:30, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>
>      nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/a2e40c005135be85e6161f7294d749c63a6673e0/
>

Hm... this is weird. minidlna says there's no libavformat, but the
library is built fine.

[..]
checking for av_open_input_file in -lavformat... no
checking for avformat_open_input in -lavformat... no
checking for av_open_input_file in -lavformat... no
checking for avformat_open_input in -lavformat... no
configure: error: Could not find libavformat - part of ffmpeg
package/pkg-generic.mk:167: recipe for target
'/home/zeta/buildroot/nios2/output/build/minidlna-1.1.3/.stamp_configured'
failed
make: *** [/home/zeta/buildroot/nios2/output/build/minidlna-1.1.3/.stamp_configured]
Error 1

Any idea why av_open_input_file and avformat_open_input is not found?

-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
