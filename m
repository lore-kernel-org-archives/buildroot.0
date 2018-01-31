From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 16:47:15 +0100
Subject: [Buildroot] [PATCH] Updated Liberation fonts source site
In-Reply-To: <20180131151033.dwdja6i3heisr6ef@sapphire.tkos.co.il> (Baruch
 Siach's message of "Wed, 31 Jan 2018 17:10:33 +0200")
References: <CALoEJ8yDeSfTKw1=GYr_vCUGn7h7fD8VgxD6vjKZLJyk-sy=WA@mail.gmail.com>
 <20180131151033.dwdja6i3heisr6ef@sapphire.tkos.co.il>
Message-ID: <87d11q58u4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> LIBERATION_VERSION = 2.00.1
 >> -LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
 >> +LIBERATION_SITE = https://releases.pagure.org/liberation-fonts
 >> LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 >> LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 >> LIBERATION_LICENSE = OFLv1.1

 > This change is in the Buildroot master branch since last March:

 >   https://git.busybox.net/buildroot/commit/?id=53c07aa3a24d0f0a647e0e6858af5e65c6e81833

 > Peter, I guess we need this in the 2017.02.x branch as well.

Indeed, I've cherry picked it now. Normally this wouldn't be a problem
as Buildroot falls back to sources.buildroot.net, but as the web server
wasn't working ..

-- 
Bye, Peter Korsgaard
