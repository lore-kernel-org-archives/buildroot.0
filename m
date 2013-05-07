From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 07 May 2013 18:55:58 -0300
Subject: [Buildroot] [PATCH 2/2] ptpd2: new package
In-Reply-To: <20130507174311.GM5202@tarshish>
References: <1367944785-27159-1-git-send-email-gustavo@zacarias.com.ar>
 <1367944785-27159-2-git-send-email-gustavo@zacarias.com.ar>
 <20130507174311.GM5202@tarshish>
Message-ID: <5189786E.2060605@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/2013 02:43 PM, Baruch Siach wrote:

>> +config BR2_PACKAGE_PTPD2
>> +	bool "ptpd2"
>> +	help
>> +	  The PTP daemon (PTPd) implements the Precision Time protocol
>> +	  (PTP) as defined by the IEEE-1588-2008.
> 
> Please mention here also that this package is not compatible with IEEE 
> 1588-2002, and that the ptpd should be used instead.

One would assume people know which standard they're targetting, the
incompatibility is inherent in the protocol, not the daemon.
I just made it clear in the commit so that people wouldn't think i'm
crazy by doing two versions of the (presumably) same package.
I'm crazy for other reasons though :)
Regards.
