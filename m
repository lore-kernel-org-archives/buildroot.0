From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 Aug 2010 15:26:12 -0300
Subject: [Buildroot] [PATCH] Re:  Deprecate rp-pppoe package
In-Reply-To: <1282583821.613.17.camel@tr-pentomino>
References: <1278436093.12234.11.camel@localhost.localdomain>	
	<4C45EF4E.1000501@zacarias.com.ar>	
	<D61182AC8012EA4EBC531B3AF23BE1099C8208@tranzeo-mail2.12stewart.tranzeo.com>	
	<1282575167.18213.51.camel@tr-pentomino>
	<1282583821.613.17.camel@tr-pentomino>
Message-ID: <4C72BD44.9020707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/23/2010 02:17 PM, Darcy Watkins wrote:

> Same as before except now uses the new autotools infrastructure in
> buildroot (the patch to rp-pppoe.mk is different from last time).
> 
> Regards,
> 
> Darcy

I still like my previously posted solution to pppd:
http://lists.busybox.net/pipermail/buildroot/2010-July/036269.html
It gives the option to install the radius plugins with the necessary
dictionary files and converts it to gentargets.
I'll give your rp-ppppoe update a spin later.
It's unlikely these changes will go in for 2010.08 since we're already
at release candidate stage, which makes it a nice chance to get things
right to the last bit for next release.
Regards.
