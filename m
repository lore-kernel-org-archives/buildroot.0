From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Aug 2019 17:45:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: fix typo in Config.in
In-Reply-To: <20190802151803.72721-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Fri, 2 Aug 2019 17:18:03 +0200")
References: <20190802151803.72721-1-titouan.christophe@railnova.eu>
Message-ID: <87mugrsha9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Introduced in ea989ad2b2c2361c47e269dd89cb559edf561db4
 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 > ---
 >  package/mosquitto/Config.in | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
 > index 11b6d7891b..c7373d9a84 100644
 > --- a/package/mosquitto/Config.in
 > +++ b/package/mosquitto/Config.in
 > @@ -21,7 +21,7 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 >  	  Build and install the mosquitto broker onto target.
 
 >  comment "mosquitto broker needs a system with MMU"
 > -	depends on BR2_PACKAGE_MOSQUTTO && !BR2_USE_MMU
 > +	depends on BR2_PACKAGE_MOSQUITTO && !BR2_USE_MMU

Hah, so my bugfix introduced another bug - Sorry about that.

-- 
Bye, Peter Korsgaard
