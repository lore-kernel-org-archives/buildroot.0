From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 08:35:20 +0200
Subject: [Buildroot] [PATCH v4 08/15] package/gcc: switch to gcc 8.x as
 the default
In-Reply-To: <20190623182145.459e0154@windsurf> (Thomas Petazzoni's message of
 "Sun, 23 Jun 2019 18:21:45 +0200")
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-9-giulio.benetti@micronovasrl.com>
 <20190622214410.4bc6022e@windsurf>
 <29b577b0-8c65-7038-929b-ad2828ec7495@gmail.com>
 <20190623182145.459e0154@windsurf>
Message-ID: <877e9ba3tj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> Thomas, I have the same question about gdb 7.12.x.

 > I think we should also drop it. I was keeping it because it was the
 > last gdb version that could be built with a toolchain that doesn't have
 > C++11 support. But well, C++11 is there since gcc 4.8, so let's assume
 > most sane people have moved their distribution to a version that has
 > gcc 4.8 at least.

 > So on my side, green light to drop gdb 7.12.

Same from me!

-- 
Bye, Peter Korsgaard
