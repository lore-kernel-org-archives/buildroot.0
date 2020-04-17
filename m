From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 16:16:48 +0200
Subject: [Buildroot] [PATCH v3] package/swupdate: add basic systemd
 service
In-Reply-To: <CANQCQpY50FLwcx40f2o=aqSK5tjNbHge1QyuJ7-aofbpO3P75A@mail.gmail.com>
References: <20200416190209.40757-1-matthew.weber@rockwellcollins.com>
 <20200417085648.68898eb5@windsurf.home>
 <CANQCQpY50FLwcx40f2o=aqSK5tjNbHge1QyuJ7-aofbpO3P75A@mail.gmail.com>
Message-ID: <20200417161649.5f906c1a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2020 07:33:46 -0500
Matthew Weber <matthew.weber@collins.com> wrote:

> Yeah the problematic part is that the web server args require a
> specific quoting so that that sub option can pick those up.  I'll take
> a look at the yocto approach as they went to a shell script launch
> instead to add swupdate.d/ as an option as well.   [1][2]  Maybe we
> just adopt exactly what they're doing as it doesn't look to bad
> (config file is in a different location)

Yes, the "arguments in the arguments" logic of swupdate has also caused
me some troubles not long ago. It's not such a great idea :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
