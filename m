From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Sep 2020 10:47:53 +0200
Subject: [Buildroot] CVE analysis of the resiprocate package
In-Reply-To: <87wo10vhp1.fsf@BL-laptop>
References: <20200907071032.C7EB26064C@crulimr02.rockwellcollins.com>
 <CAMQcK5KyWBPOW7s9BD7xaE5nd15SzEARFf8sDm9aYq=E6bqVbA@mail.gmail.com>
 <20200909235739.4ccaa8b6@windsurf.hq.k.grp>
 <87zh5wvkvw.fsf@BL-laptop> <87wo10vhp1.fsf@BL-laptop>
Message-ID: <20200911104753.49ab4f19@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Sep 2020 10:30:34 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Among the 2412 packages there are 121 packages for which CVEs refer to
> minor version.

Could you provide that list, as well as the CPE ID entries that have a
minor version, so that we can get a feeling of what it looks like ?

The question is how to deal with this minor version field. Ignore the
CPE ID when the minor version field is not "*" ? Something else ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
