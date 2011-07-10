From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jul 2011 14:00:42 +0200
Subject: [Buildroot] [PATCH 07/28] barebox: re-indent variable
	definitions
In-Reply-To: <20110710122529.59118e17@skate> (Thomas Petazzoni's message of
 "Sun, 10 Jul 2011 12:25:29 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <a7757c6616c0eb9d9f1a3dddf06a3be2f24adcb0.1309895466.git.thomas.petazzoni@free-electrons.com>
 <87mxgm1pjw.fsf@macbook.be.48ers.dk> <20110710122529.59118e17@skate>
Message-ID: <87oc12z6ol.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Sun, 10 Jul 2011 10:57:07 +0200,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> I prefer the BAREBOX_CAT = $(BZCAT) style, which is the most commonly
 >> used style under package:

 Thomas> This assignation is removed by patch 8/28, which convers Barebox to
 Thomas> GENTARGETS :

Yes, most of it (but not VERSION/SOURCE/SITE), but ok - I've ammended
patch 8 with the ':=' -> '=' conversion and dropped patch 7.

-- 
Bye, Peter Korsgaard
