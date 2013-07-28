From: Belisko Marek <marek.belisko@gmail.com>
Date: Sun, 28 Jul 2013 21:38:18 +0200
Subject: [Buildroot] [PATCH] libiqrf: Bump to v0.1.2 + update build
	system.
In-Reply-To: <20130728160553.64482586@skate>
References: <1372884680-14309-1-git-send-email-marek.belisko@open-nandra.com>
 <20130728160553.64482586@skate>
Message-ID: <CAAfyv35O8eQDCtpCTSBexLEYW-bQVuOzd2zoBZViEC4HRUi5gA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jul 28, 2013 at 4:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Marek Belisko,
>
> On Wed,  3 Jul 2013 22:51:20 +0200, Marek Belisko wrote:
>> v0.1.2 update build system from autotools to cmake.
>
> Committed, thanks. I had to add a simple patch to the CMakeLists.txt to
> avoid CMake needlessly checking for a C++ compiler. It would be good if
> this patch could be upstreamed.
Thanks. Sure I'll take your patch and add it upstream.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

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
