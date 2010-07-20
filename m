From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Tue, 20 Jul 2010 12:44:22 -0700
Subject: [Buildroot] Deprecate rp-pppoe package
In-Reply-To: <4C45EF4E.1000501@zacarias.com.ar>
References: <1278436093.12234.11.camel@localhost.localdomain>
	<4C45EF4E.1000501@zacarias.com.ar>
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1099C8208@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'll take that on early August when I get back from vacation.  I'll need
to set up to repeat the test case and probably want to also try it out
on a couple of other processors I have available (an ARM11 MX31 and an
x86 Atom as well as the PPC405).  And of course, upgrade the version
etc.

Buildroot doesn't have the freeradius client in it, so I'll probably
have to add that as well.


Regards,

Darcy


-----Original Message-----
From: Gustavo Zacarias [mailto:gustavo at zacarias.com.ar] 
Sent: Tuesday, July 20, 2010 11:48 AM
To: Darcy Watkins
Cc: buildroot
Subject: [Spam Bayesian - ] - Re: [Buildroot] Deprecate rp-pppoe package
- Bayesian Filter detected spam

On 07/06/2010 02:08 PM, Darcy L. Watkins wrote:

> Hello,
> 
> Before you remove the rp-pppoe package from buildroot, I have a
> question.  Does the pppoe plugin for pppd include the access
> concentrator (AC) support in it as well?
> 
> I ask this because most people only care about the client side and
don't
> think much about the server side you connect it to.
> 
> A while back, I cross compiled the AC functionality of rp-pppoe on
> powerpc, added a freeradius client and demo'd a simple embedded AC on
an
> AMCC Taihu involving, a private LAN, freeradius running on a server
> machine and a windows PC running its PPPoE client.  I was able to
> advertise numerous "services" from the Taihu and have the PC be able
to
> select and connect to them using PPPoE sessions.
> 
> Regards,
> 
> Darcy

Hi.
Hmm we might keep rp-pppoe for server-side functionality.
Do you feel like migrating the package to the latest infrastructure and
updating to the latest version?
Regards.
