From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 15:11:03 +0100
Subject: [Buildroot] [v3,
	12/12] Add option for paranoid unsafe path checking
In-Reply-To: <548B8601.8050109@openwide.fr>
References: <1418429047.1462.11.camel@posteo.de> <548B8601.8050109@openwide.fr>
Message-ID: <1418479863.2167.3.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sa, 2014-12-13 at 01:19 +0100, Romain Naour wrote:
> Hello J?rg,
> 
> Le 13/12/2014 01:04, J?rg Krause a ?crit :
> > Hi Romain Naour,
> > 
> > what should I do if a package build fails because of an unsafe path
> > error? Propose a patch for the package?
> > 
> 
> Yes, you needs patch the package's build system to remove the host path.

Many thanks! So hostpad and wpa_supplicant need patches.

> 
> This error appear if one of the following paths is used during the
> cross-compilation:
> "/lib"
> "/usr/include"
> "/usr/lib"
> "/usr/local/include"
> "/usr/local/lib"

One more question: Why are these pathes unsafe for cross-compilation?

Best regards
J?rg Krause
