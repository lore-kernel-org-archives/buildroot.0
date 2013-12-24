From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Dec 2013 08:41:14 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-23
In-Reply-To: <20131224073009.58151100F70@stock.ovh.net>
References: <20131224073009.58151100F70@stock.ovh.net>
Message-ID: <201312240841.14750.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 24 December 2013 08:30:08 Thomas Petazzoni wrote:
>    powerpc | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/c6ed5a9d0732263d3fdd464770a6bf602602c169/
>     mipsel | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/14d8468d4e547b0975c4abbd7458325a1c4d24e3/
>    aarch64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/1baade69413055a4df80a511352f70903e1b033f/
>       mips | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/2dcd3dea32e1c761d7f2ade17bc085b33316a4e5/
>     x86_64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/3e0c346a1cda21f8e866632cc282f05680129f84/
>   mips64el | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/86b4faa0cf1a8f0a3f6dfc2fb816432c876988ef/

Those five should be fixed with either Thomas' patch or mine.

>        arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/c1b9230e99ccf7b377c6884ab42785c80a784888/
>        sh4 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/b9f48df570b15fc6c1911af7dade3dfb892efe10/
>       i686 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/a2308726b2d29e536ea88cd87ba3d150ceba8650/
>        arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/cf8687aa894c011fdf4e4247025d0a7f8d33a102/
>        arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/24bb9a23fece88d91073011da1cebb5dd76ff395/
>   mips64el |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/ee22617e0b845c0152b5d265d452bf77d8c74e55/

Missing dependency on python-protobuf ?

>    powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/a098380497f97d5daf279ec8d086d4df1cb5d7d0/

Too old kernel headers, like for dvb-apps.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
