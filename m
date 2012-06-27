From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 27 Jun 2012 09:31:26 +0200
Subject: [Buildroot] fails to build host-ncurses
In-Reply-To: <20120627092033.614b647c@skate>
References: <CAAfyv37nm-iTr78FzpDoNfrG9u7ARE7hnKWQV4vSgMXMN6BdQA@mail.gmail.com>
 <20120627092033.614b647c@skate>
Message-ID: <CAAfyv36C+UBq9aNMEWCu06ozEpP7LY+cirhY5s6c365v_JXdRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 27, 2012 at 9:20 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 27 Jun 2012 00:06:41 +0200,
> Belisko Marek <marek.belisko@gmail.com> a ?crit :
>
>> Am I missing some host libs?
>
> You're missing the static version of libc. Depending on your distro, it
> might be installed through the libc6-dev package (Debian/Ubuntu), or
> through the glibc-static package (or something similar on
> Fedora/Redhat distros).
Thanks. I have Fedora 17. I was going through BR documentation but
cannot find something
about distro preinstalled packages. IMO this could be added to
documentation to avoid email like mine ;)
>
> Basically, search for the package in your distro that will install the
> libc.a file.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Cheers,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
