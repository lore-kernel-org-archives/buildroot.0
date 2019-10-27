From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 27 Oct 2019 22:10:23 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-10-24
In-Reply-To: <20191026195327.6083a565@windsurf.home>
References: <20191025061750.1CDB387FC3@hemlock.osuosl.org>
 <20191026195327.6083a565@windsurf.home>
Message-ID: <d3c68ac1-d14f-6b4e-5dc2-1f424c0412c3@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 10/26/19 7:53 PM, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Fri, 25 Oct 2019 06:17:43 -0000
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>>      arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/01162ac0f73eeb051d6c9570961d1966d3d0b548 | ORPH
> 
> This build failure is currently happening only on your machine:
> 
>    http://autobuild.buildroot.net/?reason=host-icu-64-2
> 
> Could you do some analysis of what's going on ?

Basically there was not python3 distutils package installed, so i've 
worked around it by installing it with:
sudo apt install python3-distutils
as referenced here:
https://github.com/Homebrew/linuxbrew-core/issues/12680

Now it builds correctly host-icu-64-2.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
