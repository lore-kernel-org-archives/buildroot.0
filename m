From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 24 Apr 2013 12:44:20 +0000
Subject: [Buildroot] [PATCH 5/7] arc: Add support for ARC-specific GCC
In-Reply-To: <20130422175605.135d02f5@skate>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <1366630651-6857-6-git-send-email-mjonker@synopsys.com>
 <20130422175605.135d02f5@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D6339FA04F@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> diff --git a/support/gnuconfig/config.sub 
>> b/support/gnuconfig/config.sub index 8509813..b2958ad 100755
>> -	| arc \
>> +	| arc | arceb \

> This should be in a separate patch. Is this change upstream in the gnuconfig project. We from time to time sync up with the upstream variant, so if you want those changes to be preserved over time, they need to be upstreamed.

The change is in the upstream project now. Would you like me to change the gnuconfig patch in BuildRoot from 'add ARC to gnuconfig' to 'update gnuconfig from upstream'?

Mischa
