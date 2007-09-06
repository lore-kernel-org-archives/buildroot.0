From: Andrew E. Mileski <andrewm@isoar.ca>
Date: Thu, 06 Sep 2007 16:41:41 -0400
Subject: [Buildroot] Make sfdisk work
In-Reply-To: <1184401509.4954.29.camel@elrond.sweden.atmel.com>
References: <5d75f4610707140035n5a40b425u590a6bac78fa5ca8@mail.gmail.com>
	<1184401509.4954.29.camel@elrond.sweden.atmel.com>
Message-ID: <46E06605.6010308@isoar.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
> l?r 2007-07-14 klockan 14:35 +0700 skrev BuraphaLinux Server:
>> Attached is a patch for sfdisk to make it work.  I sent it some time
>> ago but heard nothing back.  If the patch is bad, please tell me why.
> 
> Looks to me that you "fix" sfdisk by restricting the size of the disk to
> < 4 GB
> 
> Best Regards
> Ulf Samuelsson

Old issue.  Still a problem on the trunk.  For a better solution, see:
   http://busybox.net/bugs/view.php?id=1153
Summary: use llseek64() instead of _syscall5(_llseek)

--
Andrew E. Mileski
