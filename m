From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 5 Sep 2012 07:03:05 +0300
Subject: [Buildroot] [PATCH 1/2] dnsmasq: bump to version 2.63
In-Reply-To: <504642CD.3030106@zacarias.com.ar>
References: <1346767658-7968-1-git-send-email-gustavo@zacarias.com.ar>
 <20120904180016.GC3768@tarshish> <504642CD.3030106@zacarias.com.ar>
Message-ID: <20120905040305.GB3631@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, Sep 04, 2012 at 03:05:01PM -0300, Gustavo Zacarias wrote:
> On 09/04/12 15:00, Baruch Siach wrote:
> 
> >> +DNSMASQ_LICENSE = GPLv2 GPLv3
> > 
> > Looks confusing. Is it "either v2 or v3"? If so, then I think
> > 
> > DNSMASQ_LICENSE = Dual GPLv2/GPLv3
> > 
> > would be better.
>
> They specify (in not so clear terms) that you can choose one of them,
> see CHANGELOG.archive line 2393.
> I'm pretty short of sleep these days, "Dual" would be choose either or
> both apply?

Well, IANAL, but as far as I know "Dual" means "choose either".

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
