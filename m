From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Mar 2012 22:20:48 +0100
Subject: [Buildroot] libupnp version 1.6.14 Not OK : httpd (busybox)
	http header not accepted by libupnp 1.6.14 ?
In-Reply-To: <bf7504c2ffea0a43d73d35c2278d74b9@zacarias.com.ar>
References: <20120321130510.D12F095418@busybox.osuosl.org>
 <CE13F41522F543FF9EEA63F4B397A7BB@JohanW7>
 <bf7504c2ffea0a43d73d35c2278d74b9@zacarias.com.ar>
Message-ID: <201203242220.48743.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 23 March 2012 18:44:49 Gustavo Zacarias wrote:
> Didn't get much time to play with Debian's libupnp, the whole thing 
> looks tangled, they seemed to have forked circa 1.6.6 and went their own 
> way.

 They haven't gone their own way, there just haven't been any real 
updates to Debian's libupnp in the last two years [1][2] - 1.6.7
was released after the last Debian release (minus one small packaging
fix).

 Regards,
 Arnout


[1] http://packages.debian.org/changelogs/pool/main/libu/libupnp/current/changelog
[2] http://packages.debian.org/changelogs/pool/main/libu/libupnp4/current/changelog
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
