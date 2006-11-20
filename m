From: Bernhard Fischer <rep.nop@aon.at>
Date: Mon, 20 Nov 2006 13:10:36 +0100
Subject: [Buildroot] make from scratch bugs..
In-Reply-To: <20061112094759.GA26518@zelow.no>
References: <20061105091300.GA11317@zelow.no> <20061105113957.GA14530@zelow.no>
	<20061112094759.GA26518@zelow.no>
Message-ID: <20061120121036.GA4438@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 12, 2006 at 10:47:59AM +0100, Thomas Lundquist wrote:
>On Sun, Nov 05, 2006 at 12:39:57PM +0100, Thomas Lundquist wrote:
>> 
>> no problem with kernel headers 2.6.12.
>
>It's the script fix_includes.sh in extra/scripts that doesen't
>understand the new versioning. I just copied the script from the latest
>uClibc snapshot and it seemed to work.
>
>(so, it's a sortof uClibc "bug" I guess.)

Yes, that'd be it. I don't think that it will be fixed for 0.9.28 since
there was no 2.6.18 back when that was released, fwiw.

You may want to ping the uClibc list on this.

Thanks for the heads up, though.
