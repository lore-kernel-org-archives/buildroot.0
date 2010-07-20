From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Jul 2010 15:47:42 -0300
Subject: [Buildroot] Deprecate rp-pppoe package
In-Reply-To: <1278436093.12234.11.camel@localhost.localdomain>
References: <1278436093.12234.11.camel@localhost.localdomain>
Message-ID: <4C45EF4E.1000501@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/06/2010 02:08 PM, Darcy L. Watkins wrote:

> Hello,
> 
> Before you remove the rp-pppoe package from buildroot, I have a
> question.  Does the pppoe plugin for pppd include the access
> concentrator (AC) support in it as well?
> 
> I ask this because most people only care about the client side and don't
> think much about the server side you connect it to.
> 
> A while back, I cross compiled the AC functionality of rp-pppoe on
> powerpc, added a freeradius client and demo'd a simple embedded AC on an
> AMCC Taihu involving, a private LAN, freeradius running on a server
> machine and a windows PC running its PPPoE client.  I was able to
> advertise numerous "services" from the Taihu and have the PC be able to
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
