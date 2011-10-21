From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2011 17:34:35 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <CAGm1_ku2137QALAccV7f-=e54a4iXLXgo_YuYhKqqtcTzK2qqA@mail.gmail.com>
References: <20111017184718.71afc290@skate> <20111021154303.43f98ccd@skate>
 <CAGm1_kuP2sT=fXdvmnHWbC=B0ie4v4swZTbs9eKHGXVAT5FERA@mail.gmail.com>
 <20111021155826.061d9b8f@skate>
 <CAGm1_ku2137QALAccV7f-=e54a4iXLXgo_YuYhKqqtcTzK2qqA@mail.gmail.com>
Message-ID: <20111021173435.445b8d5b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 21 Oct 2011 16:24:03 +0200,
Yegor Yefremov <yegorslists@googlemail.com> a ?crit :

> What is root password: 'root', 'linux' or something else? I tried
> both, but failed. I mean, if someone tries to copy this line, he won't
> be able to login.

Ah, my mistake, I copy pasted the hashed password from a project, and
the password is not 'root'. I've fixed that in the slides, will be part
of the next version I'll upload.

> Perhaps some howto about how to generate own root password and put it
> in the script could be also useful. On the other hand it could be
> included in the main documentation later.

Just use mkpasswd from the whois package in Debian/Ubuntu distributions.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
