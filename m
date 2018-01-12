From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 12 Jan 2018 12:45:06 +0200
Subject: [Buildroot] [PATCH 1/1] unbound: new package
In-Reply-To: <jt1miexfp7.ln2@ID-313208.user.individual.net>
References: <20180111232039.24270-1-stefan.froberg@petroprogram.com>
 <jt1miexfp7.ln2@ID-313208.user.individual.net>
Message-ID: <7b6d5bbd-86f5-6c81-e26e-db8b29ae2831@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oh, forgot ...


>> +	depends on BR2_PACKAGE_OPENSSL
> Why not "select BR2_PACKAGE_OPENSSL"?
> Did you test with libressl as well?
>

That cannot be select because it's a choise and if I remember buildroot
manual and
what Thomas said, you can't (or actually shouldn't) select from choice
unless
absolutely necessary (like, for example, in my turbovnc patch...have to
remember update that too...)

But I test with libressl too

Regards
Stefan
