From: Robert Nelson <robert.nelson.work@gmail.com>
Date: Thu, 01 May 2008 12:14:25 -0500
Subject: [Buildroot] What is the best way to deactivate XML Parser
 (expat) for ARM build?
In-Reply-To: <326f33790805010916n321c394ej93bf891b65c34986@mail.gmail.com>
References: <326f33790805010751v24facd35o4207041c297da12c@mail.gmail.com>	
	<4819E7FF.5000902@gmail.com>
	<326f33790805010916n321c394ej93bf891b65c34986@mail.gmail.com>
Message-ID: <4819FA71.4010901@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arun,

Not 100% on that one. I also had a finished build of 
at91sam9261ek_defconfig in the same buildroot directory, which may have 
solved that dependency.. Rebuilding now from a fresh install.

--
Robert Nelson
FAE - Digi-Key

Arun Reddy wrote:
> Robert,
>
> Thank you very much for that information! I was almost about to try to 
> do a build for at91sam9260 or a previous version just to be certain. I 
> did make expat, then after that finished I went ahead and proceeded 
> with the build by typing make. I got past the error above about 
> libexpat, but I ended up getting to an error saying:
>
> Checking for XML::Parser...configure: error: XML::Parser perl module 
> is required for intltool.
>
> Was this supposed to be resolved with make expat as well? Or does this 
> require a different package to be passed into make? Thanks again.
