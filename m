From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Jul 2011 22:49:19 +0200
Subject: [Buildroot] ccache directory
In-Reply-To: <20110720181955.36911f14@skate> (Thomas Petazzoni's message of
 "Wed, 20 Jul 2011 18:19:55 +0200")
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
 <20110720181955.36911f14@skate>
Message-ID: <87livs1xv4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Would you accept a patch that re-introduces BR2_CCACHE_DIR ?

 Thomas> I guess your use case is valid, so I would personally accept
 Thomas> such a patch. I don't like cluttering the "Build options" menu
 Thomas> with too many options, but I guess this option is a valid thing
 Thomas> to have when ccache support is enabled.

Or simply drop the custom ccache location and let people set CCACHE_DIR
if they don't like the default (and hence expected) ~/.ccache location.

-- 
Bye, Peter Korsgaard
