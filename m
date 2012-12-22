From: Belisko Marek <marek.belisko@gmail.com>
Date: Sun, 23 Dec 2012 00:00:14 +0100
Subject: [Buildroot] XBMC
In-Reply-To: <CAGduivzZU=-GOQzAj4keyBVVMZ=9zuXaHX0wD68X7VSpB-c1aQ@mail.gmail.com>
References: <CAGduivzZU=-GOQzAj4keyBVVMZ=9zuXaHX0wD68X7VSpB-c1aQ@mail.gmail.com>
Message-ID: <CAAfyv37LSX4FHVSdV-DbwGBQzPqNYrg_PTjhj5FJ18MR2iUGGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, Dec 22, 2012 at 12:58 AM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> Hi everyone,
>
> I wanted to add XBMC to buildroot, but since it's a pretty big
> application with a lot of dependency, I have created a separated tree
> at github :
> https://github.com/maximeh/buildroot
I was look at some last of your commits and the are some things which
could be good to fix before sending patches for review:
1. new packages doesn't contain licence info in mk file
2. new packages doesn't have link to webpage
3. packages which are autotools based don't need INSTALL_TARGET = YES
(it is default)
4. some packages are located at github and git protocol is used to
fetch. Please convert
according: http://buildroot.uclibc.org/downloads/manual/manual.html#github-download-url
5. lot of new packages contains really big patches (e.g.: afpfs-ng).
Patches should be post upstream
to avoid adding then to BR.

>
> I would like to know if it would be of any interest to upstream this
> before sending all theses patches for review ?
>
> Thanks
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Cheers,

mbe

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
