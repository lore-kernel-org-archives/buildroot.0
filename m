From: Belisko Marek <marek.belisko@gmail.com>
Date: Sat, 22 Dec 2012 23:10:44 +0100
Subject: [Buildroot] [PATCH 2/6] polkit: new package
In-Reply-To: <20121222161922.59aad225@skate>
References: <1356126670-16186-1-git-send-email-marek.belisko@open-nandra.com>
 <1356126670-16186-3-git-send-email-marek.belisko@open-nandra.com>
 <20121222161922.59aad225@skate>
Message-ID: <CAAfyv364mSSfqCHtxFu+DfEE8ybxszfqnQDTc20+-FiMMZXyjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Dec 22, 2012 at 4:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Marek Belisko,
>
> On Fri, 21 Dec 2012 22:51:06 +0100, Marek Belisko wrote:
>
>> +     select BR2_PACKAGE_LIBGLIB2
>> +     select BR2_DBUS_EXPAT
>
> Are you sure this shouldn't be BR2_PACKAGE_EXPAT instead?
Good catch. Thanks.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

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
