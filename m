From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 18 Dec 2012 09:52:41 +0100
Subject: [Buildroot] [PATCH] sg3-utils new package.
In-Reply-To: <20121218094835.688afe2c@skate>
References: <1355776546-25189-1-git-send-email-marek.belisko@open-nandra.com>
 <20121218094835.688afe2c@skate>
Message-ID: <CAAfyv37=U0YtKsNkoCxTA2iRAXwgTETrcuOPWXmvNasnOqZaSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Dec 18, 2012 at 9:48 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Marek Belisko,
>
> On Mon, 17 Dec 2012 21:35:46 +0100, Marek Belisko wrote:
>
>> +SG3_UTILS_INSTALL_STAGING = YES
>
> Hum, why is this needed? Does sg3_utils installs some libraries or
> headers that are useful for other packages?
I'm working on adding udisks to buildroot and udisks have dependency on
sg3-utils library so this is the reason why installing to staging.
I've read somewhere on ML you was working also on udisks package.
Was it successful?
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
