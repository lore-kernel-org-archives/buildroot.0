From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 16 Jan 2013 09:49:10 +0100
Subject: [Buildroot] [PATCH v2 5/6] lvm2: Compile and install
	application library.
In-Reply-To: <20130116090650.6ae22e1b@skate>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-6-git-send-email-marek.belisko@open-nandra.com>
 <20130107223802.26215d46@skate>
 <CAAfyv364LfD4uwtOL6+k=Gyd5cvFt-MzXJYx-6e5LLXMgWqsAQ@mail.gmail.com>
 <20130116090650.6ae22e1b@skate>
Message-ID: <CAAfyv35b1+o6iKNO4FTn8ED7qvjbSkupLq_autoRr55fWo0JBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jan 16, 2013 at 9:06 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Belisko Marek,
>
> On Tue, 15 Jan 2013 21:53:48 +0100, Belisko Marek wrote:
>
>> What about to compile everything (device mapper + app library) and
>> only install things which user select in
>> config.
>
> That's usually what we do in relatively small packages for which the
> overall build time is not so significant to be worth the effort of
> doing selective compilation. We however do selective installation if
> needed to only install the required files.
OK. Any ideas how to proceed with this patch? Without that udisks (with lvm2)
cannot work. IMO original patch is OK despite of fact it build only
liblvm (not libdm + lvm2)

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Regards,

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
