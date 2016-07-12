From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 10:46:03 +0200
Subject: [Buildroot] raspberry3_defconfig error
In-Reply-To: <20160710182642.GE3688@free.fr> (Yann E. MORIN's message of "Sun, 
 10 Jul 2016 20:26:42 +0200")
References: <HK2PR0401MB1329D3F86C57BD1E93FC6137B33E0@HK2PR0401MB1329.apcprd04.prod.outlook.com>
 <20160710182642.GE3688@free.fr>
Message-ID: <87vb0b6y7o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> --2016-07-11 01:48:20-- 
 >> http://sources.buildroot.net/linux-26f3b72a9c049be10e6af196252283e1f6ab9d1f.tar.gz
 >> Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
 >> Connecting to sources.buildroot.net 
 >> (sources.buildroot.net)|176.9.16.109|:80... connected.
 >> HTTP request sent, awaiting response... 404 Not Found
 >> 2016-07-11 01:48:22 ERROR 404: Not Found.

 > Indeed, s.b.o. does not cache those files.

FYI, I've now manually mirrored this specific tarball on
sources.buildroot.org.

-- 
Bye, Peter Korsgaard
