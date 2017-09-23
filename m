From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:13:42 +0200
Subject: [Buildroot] [PATCH 01/49 v2] package/asterisk: new package
In-Reply-To: <ee34d49f318e171beb6b4ba642d04c960aa9560e.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <ee34d49f318e171beb6b4ba642d04c960aa9560e.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <b90d6648-d11e-b01f-bc9b-da782bb15269@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-09-17 23:39, Yann E. MORIN wrote:
> Asterisk: the flagship of telephony on Linux. These are the lines of
> code whose continuous mission is to power small and large enterprises
> telephony systems, to boldly provide IP PBX where no one has done so
> before.
[snip]

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 I have applied to master with the following changes:

     - make libilbc a mandatory dependency instead of using the bundled one;
     - add license, license files, and license file hashes;
     - minor spelling corrections;
     - remove redundant trailing backslash reported by check-package;
     - rewrap help text to 72 columns instead of 68

 Note the first change: when --without-ilbc is specified, it will actually build
its internal fork.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
