From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Mar 2013 08:21:29 +0100
Subject: [Buildroot] Problem with buildroot-2013.02 - ncurses
In-Reply-To: <513FB6CF.1070301@mind.be>
References: <84EA0F7435E5F64C9B660453645DB90497AD4DEF0D@DSW350.wattens.swarovski.com>
 <20130307093024.30cb7d23@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52A6B0@DSW350.wattens.swarovski.com>
 <20130307140818.0d48c197@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52AA50@DSW350.wattens.swarovski.com>
 <513FB6CF.1070301@mind.be>
Message-ID: <20130313082129.188d23f2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 13 Mar 2013 00:14:23 +0100, Arnout Vandecappelle wrote:

>  Looks like there's something fishy with your host's environment...

I agree. I had a look at Werner's build log yesterday evening, and it
really doesn't make much sense to have this failure. I agree with
Arnout's suggestion of looking at the preprocessed C code to see what's
going on.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
