From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Nov 2013 15:15:14 +0100
Subject: [Buildroot] Xineramaproto
In-Reply-To: <FC11F8FF209D4453815AD3F26757E19D@tux.local>
References: <233A67DA67A045DF84F76ABF9CA04635@tux.local>
 <BAF922FAE74849899122A8651F8AFD3C@tux.local>
 <3F863D59E1624E3FA3BE86B5BE40EA59@tux.local>
 <20131112115854.244577e6@skate>
 <FC11F8FF209D4453815AD3F26757E19D@tux.local>
Message-ID: <20131115151514.702c2cc4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwyll Gwyllin,

On Fri, 15 Nov 2013 15:00:15 +0100, Gwyll Gwyllin wrote:

> thank you for the link. I've checked my inbox and spam folder, and i could 
> not find your previous letter. Anyway ... sorry for the missing answer.

Hum, strange. Since the mail appeared on the mailing list, I don't
think the problem was on my side. But anyway, doesn't matter much.

> You are right, i'm trying to compile an older version. I have a bluechip 
> device and the manufacturer gave me that version. I've tried to compile a 
> recent version too, but it's compile have also failed.

Just curious, what kind of device is this "bluechip device"? I've
googled a bit, and didn't find anything relevant.

Regarding Buildroot, I believe you have two options:

 (1) Use the vendor-provided Buildroot version, but then you should ask
     the vendor who provided this Buildroot for support (or another
     third party willing to offer support).

 (2) Use the mainline Buildroot, and enjoy community support. In many
     cases, the modifications made by vendors on Buildroot are not very
     complicated, so it can be quite easy to adapt them to the mainline
     Buildroot (and maybe contribute them to reduce the maintenance
     effort).

If you have a build failure, or another problem, with a recent version
of the mainline Buildroot, then please let us know. We definitely want
to fix problems. Just tell us the Buildroot version being used,
the .config file, and the last 200-300 lines of the build output.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
