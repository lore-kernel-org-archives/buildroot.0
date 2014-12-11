From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 16:19:36 +0100
Subject: [Buildroot] [PATCH v2 1/1] Added mpd-mpc, mpc client to mpd
In-Reply-To: <1418244950.1312.15.camel@posteo.de>
References: <1418116054-31925-1-git-send-email-tbultel@free.fr>
 <1418244950.1312.15.camel@posteo.de>
Message-ID: <20141211161936.115aa7fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed, 10 Dec 2014 21:55:50 +0100, J?rg Krause wrote:

> I had the idea to group all MPD clients (currently mpc and ncmpcpp)
> under mpd and name them MPD_CLIENT_MPC, MPD_CLIENT_NCMPCPP. There exist
> several more clients which are only valuable with MPD. How about this?

This is not typically something that we do, as we prefer to keep the
upstream name for our packages, whenever possible.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
