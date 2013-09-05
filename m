From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 5 Sep 2013 09:24:05 +0200
Subject: [Buildroot] [PATCH] system: only set the root password if it's
 not empty
In-Reply-To: <20130728150626.5b57ffae@skate>
References: <20130702085224.GA25620@berrier.lan>
 <20130702173111.GA3221@free.fr> <20130703044618.GA4406@berrier.lan>
 <CAAXf6LVNOFmX9HXAMEJH=mbRkgmhfAxqqiL8e+Qkrsw_jxU9Eg@mail.gmail.com>
 <20130728150626.5b57ffae@skate>
Message-ID: <CAAXf6LXS-Lf--tTUfwcQVRS4KRi8xhYsQeTwxW8uWmM2NDOG7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Wade,

On Sun, Jul 28, 2013 at 3:06 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Sun, 28 Jul 2013 10:40:15 +0200, Thomas De Schampheleire wrote:
>
>> Should we create a separate host-mkpasswd package based on the whois
>> sources? (https://github.com/rfc1036/whois)
>> Or should we add the whois package, and depend on that?
>> To me, the former seems more appropriate...
>
> If we can make a very simple host-mkpasswd package like we have the
> host-makedevs package (with the source code included in
> package/<dir>/), I think it would be good.
>

Since a host-mkpasswd package has been merged now, which should fix
problems on some Redhat and Slackware machines, and given the comments
given by Yann, do you agree to drop this patch?

Best regards,
Thomas
