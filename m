From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 22:31:16 +0200
Subject: [Buildroot] [PATCH 1/2] mosquitto: bump to version 1.4.11
In-Reply-To: <CAPi7W82izo61-GAHts23q4x+ZHQoPgZTC9=XRbrQpVha21Zvyg@mail.gmail.com>
References: <1491334650-15708-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170404220136.53846968@free-electrons.com>
 <CAPi7W82izo61-GAHts23q4x+ZHQoPgZTC9=XRbrQpVha21Zvyg@mail.gmail.com>
Message-ID: <20170404223116.5f77e928@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Apr 2017 22:29:33 +0200, Fabrice Fontaine wrote:

> When WITH_ADNS is set, the following lines of config.mk will add -lanl
> ifeq ($(WITH_ADNS),yes)
>     BROKER_LIBS:=$(BROKER_LIBS) -lanl
>     BROKER_CFLAGS:=$(BROKER_CFLAGS) -DWITH_ADNS
> endif
> 
> The issue in the current config.mk was the following lines (removed by my
> patch):
> ifeq ($(UNAME),Linux)
>     BROKER_LIBS:=$(BROKER_LIBS) -lanl
> endif

OK, thanks, makes sense!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
