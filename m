From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 6 Nov 2009 18:37:28 +0000 (UTC)
Subject: [Buildroot] How to figure out what a package is?
References: <hd1mof$7qt$1@ger.gmane.org>
	<BD79186B4FD85F4B8E60E381CAEE190901E84907@mi8nycmail19.Mi8.com>
	<hd1otv$erv$1@ger.gmane.org>
	<d6cda7730911061024o2da77a2dy65124d3dac4d3904@mail.gmail.com>
Message-ID: <hd1qd8$kr2$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-11-06, Thiago A  Corr?a <thiago.correa@gmail.com> wrote:
> On Fri, Nov 6, 2009 at 4:12 PM, Grant Edwards <grant.b.edwards@gmail.com> wrote:
>>
>> And the help for a package is located...
>
> From Kconfig (ie, inside the interface from "make menuconfig")
> there is a Help button accessible with the arrow keys in your
> keyboard. "Clicking" that help button will show you the text
> from the help section of the Config.in

Thanks.  I don't have buildroot installed anywhere at the
moment, so I'm just browsing the GIT source tree to come up
with a list of available web servers.  The list stands at

  boa
  busybox
  lighttpd
  thttpd
  tinyhttpd

The ones with httpd in the name were obvious enough.  There
were quite a few packages with names I didn't recognize, and
that's where the "help" was needed.  :)
  
-- 
Grant Edwards                   grante             Yow! World War Three can
                                  at               be averted by adherence
                               visi.com            to a strictly enforced
                                                   dress code!
