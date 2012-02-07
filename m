From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Feb 2012 15:54:04 +0200
Subject: [Buildroot] Buildroot networking problems
In-Reply-To: <4F3126EB.8000409@labri.fr>
References: <4F302D71.9020308@labri.fr> <87ipjjvgtg.fsf@macbook.be.48ers.dk>
 <4F3126EB.8000409@labri.fr>
Message-ID: <20120207135404.GB3690@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jigar,

On Tue, Feb 07, 2012 at 02:28:11PM +0100, Jigar SOLANKI wrote:
> Le 06/02/2012 21:37, Peter Korsgaard a ?crit :
> >>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:
> > 
> >  Jigar> Hi all,
> >  Jigar> I've built a Buildroot Linux on a Leon3 CPU, everything works fine
> >  Jigar> except the network configuration.
> > 
> >  Jigar> I have the eth0 interface configured correctly with a default gw,
> >  Jigar> netmask etc...but when I ping the interface adress itself, it doesnt
> >  Jigar> respond at all.
> > 
> >  Jigar> I've also tried to ping 127.0.0.1, same result, lo is not responding.
> >  Jigar> (I have read some posts on resolv.conf but in my case, it is not a dns
> >  Jigar> related issue, I ping numerical adresses..)
> > 
> > Please provide some more info. Please paste output of ipconfig -a. What
> > kind of errors do you get?
>
> [detailed setup description]

Please send the output of 'iptables -L -n'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
