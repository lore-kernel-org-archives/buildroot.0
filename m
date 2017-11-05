From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 14:28:11 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <28382f3f-71d0-27d3-f78f-66fe47c9186b@mind.be>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net>
 <20171102230602.3c61e8d2@windsurf> <20171102221847.GA23314@scaer>
 <20171102232345.5a434af8@windsurf>
 <3f7fff7b-be5a-42ff-985f-0e860c98acb3@mind.be>
 <20171105081028.GA2996@scaer>
 <28382f3f-71d0-27d3-f78f-66fe47c9186b@mind.be>
Message-ID: <20171105132811.GI2996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-11-05 13:18 +0100, Arnout Vandecappelle spake thusly:
> On 05-11-17 09:10, Yann E. MORIN wrote:
> > Then it is the responsibility of the package.mk to install one if it is
> > mandatory. Otherwise,that means the packaging is incomplete because it
> > does not allow the package to work as expected.
>  So you mean all packages should do like inadyn: install an example
> configuration file even if that is guaranteed not to work.

Yes, if at least because it serves as a base for the user to write their
own or fill-in the blanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
