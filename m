From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:10:58 +0200
Subject: [Buildroot] [PATCH 3/3] systemd: fix nogroup
In-Reply-To: <20180629222552.12808-4-jeremy.rosen@smile.fr>
 (=?utf-8?B?IkrDqXLDqW15?= Rosen"'s
 message of "Sat, 30 Jun 2018 00:25:52 +0200")
References: <20180629222552.12808-1-jeremy.rosen@smile.fr>
 <20180629222552.12808-4-jeremy.rosen@smile.fr>
Message-ID: <87h8kvedsd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?my" == J?r?my Rosen <jeremy.rosen@smile.fr> writes:

 > The special 65534 group is named nogroup (not nobody) in buildroot
 > tell systemd about that

 > Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
