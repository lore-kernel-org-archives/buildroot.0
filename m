From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Oct 2017 22:50:29 +0200
Subject: [Buildroot] [git commit branch/2017.02.x]
	package/x11r7/xserver_xorg-server: security bump to version 1.19.4
In-Reply-To: <20171015155651.50c30cef@windsurf> (Thomas Petazzoni's message of
 "Sun, 15 Oct 2017 15:56:51 +0200")
References: <20171014150059.CC3577FDF0@busybox.osuosl.org>
 <20171015155651.50c30cef@windsurf>
Message-ID: <87o9p8w2y2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> -	default "1.19.3" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
 >> +	default "1.19.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
 >> default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 >> default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14

 > Note that this commit forgot to update:

 > config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
 >         bool "1.19.3"

 > It will be fixed, as I'm going to apply
 > https://patchwork.ozlabs.org/patch/825811/, which bumps to 1.19.5, in
 > both locations.

Ahh yes, I'll cherry pick that one as well.

-- 
Bye, Peter Korsgaard
