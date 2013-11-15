From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 10:13:10 +0100
Subject: [Buildroot] buildroot: gcc options
In-Reply-To: <EADA2943BAC14C4AB625A3550A3BE980096DF2C30B@SI-MBX04.de.bosch.com>
References: <EADA2943BAC14C4AB625A3550A3BE980096DF2C30B@SI-MBX04.de.bosch.com>
Message-ID: <CAAXf6LU1bamXyxhjhB5rTTHM-iHRbKrsTF5m1MUJLZjOaNXmuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Nov 15, 2013 at 10:03 AM, Altunbas Sabri (DC-IA/EAH2)
<sabri.altunbas@boschrexroth.de> wrote:
>
>
> Hi together,
>
> how can i pass gcc-options ?-mfmovd -mdalign? to buildroot which I
> configured with ?external toolchain?
>

You can use the option BR2_TARGET_OPTIMIZATION for that...

Best regards,
Thomas
