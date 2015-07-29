From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 29 Jul 2015 11:30:54 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150729100334.00137b70@free-electrons.com>
References: <20150729063017.EDA6D101EBC@stock.ovh.net>
 <20150729100334.00137b70@free-electrons.com>
Message-ID: <8314698.FE2qvJLvco@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wednesday 29 July 2015 10:03:34 Thomas Petazzoni wrote:
[..]
> >         sh4a |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/bba8faf210414d956cc07629b8ba99ceed0ebdf6/
> >      aarch64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/f525b48e2982adc4987cb772be92eeda30569c13/
> >      aarch64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/0d2c2cd0bda1dd3c1e137117df535d8e02d67e8b/
> >          arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/a815a4f943e6a07f87f8f6bbf9910459575db311/
> >         i686 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/1b72769e65444322de4bfcb02200b7d999f9f5c1/
> >          arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/195f6c34904b8185d44611c3d56084cb7d3e8a14/
> >     mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/aac02dd6c5ea04ea70cfa6921a04b5558a9bbe7f/
> >          arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/fbaec431108bec088ff543771c52f2bc20e15b31/
> 
> Weird build issues.
It is a quoting problem. I will send a patch. 

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
