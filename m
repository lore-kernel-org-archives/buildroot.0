From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 11 Sep 2012 09:43:50 +0200
Subject: [Buildroot] Question: exporting
 QWS_KEYBOARD=LinuxInput:/dev/input/event0" hang application
In-Reply-To: <20120911092847.11c26ee6@skate>
References: <CAAfyv34dT-531F66fHTx8-Tk7nXP0NkSPx_L2SOYkgc--CucDw@mail.gmail.com>
 <20120910143403.48f87840@skate>
 <CAAfyv37v2DDX6NQ9srjoeudYHQnDe9OHv1hgkAFqce3KKzrppw@mail.gmail.com>
 <20120911092847.11c26ee6@skate>
Message-ID: <CAAfyv35jX845P3i3j_6iEM1fETJo6iZ2pwaa_j9MnB1mbPP96w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 11, 2012 at 9:28 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Mon, 10 Sep 2012 22:13:57 +0200,
> Belisko Marek <marek.belisko@gmail.com> a ?crit :
>
>> > Can you try to add the attached patch to the Qt package? It has been
>> > written for Qt 4.7.3, but since the patch is trivial, I guess it can be
>> > quickly adapted to Qt 4.8.2. It's the patch I had to fix the problem I
>> > encountered, but again I don't remember the exact problem, and I have
>> > been apparently too lazy to describe it in the patch description.
>> Thanks. It helps. It's not freezing with your patch.
>
> Great. The patch is more a workaround than a real bug, but it would be
> nice to implement a real fix and submit it upstream.
When finish project I'll try to work on it and post proper patch upstream.
Thanks again.
>
> Best regards,
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
