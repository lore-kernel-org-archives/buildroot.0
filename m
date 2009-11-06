From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 6 Nov 2009 16:24:21 -0200
Subject: [Buildroot] How to figure out what a package is?
In-Reply-To: <hd1otv$erv$1@ger.gmane.org>
References: <hd1mof$7qt$1@ger.gmane.org>
	<BD79186B4FD85F4B8E60E381CAEE190901E84907@mi8nycmail19.Mi8.com>
	<hd1otv$erv$1@ger.gmane.org>
Message-ID: <d6cda7730911061024o2da77a2dy65124d3dac4d3904@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 6, 2009 at 4:12 PM, Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
> And the help for a package is located...
>

From Kconfig (ie, inside the interface from "make menuconfig") there
is a Help button accessible with the arrow keys in your keyboard.
"Clicking" that help button will show you the text from the help
section of the Config.in

Kind Regards,
    Thiago A. Correa
