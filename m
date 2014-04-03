From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 15:08:00 +0200
Subject: [Buildroot] How to enable inetd in buildroot
In-Reply-To: <CAKGbVbuLPuiEtCSNu9WpWfcnq4axdFFycmyCpXTBAo1jw6pNag@mail.gmail.com>
References: <CAKGbVbuLPuiEtCSNu9WpWfcnq4axdFFycmyCpXTBAo1jw6pNag@mail.gmail.com>
Message-ID: <20140403150800.22ef96a7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Qiang Yu,

On Thu, 3 Apr 2014 18:24:19 +0800, Qiang Yu wrote:

> I'm trying to use some services provided by inetd. But can't find the
> configuration
> for enabling it and generating startup script and inetd.conf. I notice
> someone has
> already submit some patch for doing this:
> http://lists.busybox.net/pipermail/buildroot/2011-December/048207.html
> but not found in the latest buildroot.
> 
> So can somebody tell me what's the state of inetd in buildroot?
> Do I have to apply this patch to use inetd, or there is another "official"
> way?

Are you using Busybox's inetd, xinetd, or another inetd implementation?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
