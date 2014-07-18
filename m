From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Jul 2014 10:32:59 -0300
Subject: [Buildroot] Replace libev with libuv
In-Reply-To: <CALoSW64Uisj3oLvPVKZ1nQXgCTEnt1yLMqV+Gy7aK4U=Q9FcUA@mail.gmail.com>
References: <CALoSW641XSGs6H4i_q07ZfxUtRYoUMgdxBaUtus5J5C7+K=0Fw@mail.gmail.com>	<53C91D3F.4060500@zacarias.com.ar>
 <CALoSW64Uisj3oLvPVKZ1nQXgCTEnt1yLMqV+Gy7aK4U=Q9FcUA@mail.gmail.com>
Message-ID: <53C9220B.9060809@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/18/2014 10:30 AM, Nimai Mahajan wrote:

> Already tried that and it fails to build. I will give you the exact
> error when I am by my PC again. And you are right both libraries are for
> different purposes, I guess it would have been more accurate to say many
> projects can make better use of libuv than libev. I just like that libuv
> is significantly better documented which in itself makes it more usable.
> I am using other autogen.sh packages as a template but they all seem to
> have their own custom hooks which is what is confusing me. Thanks for
> the help BTW.

Hi.
Keep the list cc'ed, you've got a better chance of getting help with
everyone rather than just me, and also other people might be interested.
Yes please do, normally AUTORECONF is enough but there are a couple of
difficult packages that need some extra help.
Regards.
