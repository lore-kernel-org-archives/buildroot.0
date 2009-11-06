From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 6 Nov 2009 18:12:15 +0000 (UTC)
Subject: [Buildroot] How to figure out what a package is?
References: <hd1mof$7qt$1@ger.gmane.org>
	<BD79186B4FD85F4B8E60E381CAEE190901E84907@mi8nycmail19.Mi8.com>
Message-ID: <hd1otv$erv$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-11-06, H Hartley Sweeten <hartleys@visionengravers.com> wrote:
> On Friday, November 06, 2009 10:35 AM, Grant Edwards wrote:
>> This sounds a bit stupid, but where do you find a description
>> of what a given package is?
>> 
>> I've got a list of packages supported by buildroot.
>> 
>> How do I know what, for example, the package named "lite" is?
>> 
>> Googling for the name has proven pointless...
>
> Look at the help for the package...

And the help for a package is located...

[drumroll]

in the Config.in file that's in each of the package directories.

For my "lite" example, it's package/lite/Config.in

-- 
Grant Edwards                   grante             Yow! How's the wife?
                                  at               Is she at home enjoying
                               visi.com            capitalism?
